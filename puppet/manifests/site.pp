class jenkins {

    # get key
    exec { 'install_jenkins_key':
        command => '/usr/bin/wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | /usr/bin/apt-key add -',
    }

    # source file
    file { '/etc/apt/sources.list.d/jenkins.list':
        content => "deb http://pkg.jenkins-ci.org/debian binary/\n",
        mode    => '0644',
        owner   => root,
        group   => root,
        require => Exec['install_jenkins_key'],
    }

    # update
    exec { 'apt-get update':
        command => '/usr/bin/apt-get update',
        require => File['/etc/apt/sources.list.d/jenkins.list'],
    }

    # jenkins package
    package { 'jenkins':
        ensure  => latest,
        require => Exec['apt-get update'],
    }

    service { 'jenkins':
        ensure  => 'running',
        enable  => true,
        require => Package['jenkins'],
    }


    # jenkin port modification 8080=>8000
    file_line {'jenkins_port':
        notify  => Service['jenkins'],
        ensure => present,
        path => '/etc/default/jenkins',
        line => 'HTTP_PORT=8000',
        match => '^HTTP_PORT=8080',
    }

}

include jenkins
