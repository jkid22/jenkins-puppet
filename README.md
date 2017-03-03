# jenkins-puppet

#### Table of Contents


2. [Technical Challenge - Description](#technical-challenge)
3. [Setup - Automate the Build](#setup)
    * [github repository](#github-repository)
    * [vagrant configuration](#puppet-configuration)
    * [puppet configuration](#puppet-configuration)

4. [Questions](#questions)
    * [Implementation Hurdles](#implementation-hurdles)
    * [Importance of Ephemeral Builds](#rebuild)
    * [Information Hunt](#information-hunt)
    * [Value of Automation](#value-of-automation)

## Technical Challenge

**Objective:** Automate the installation and configuration of the Jenkins CI server.

**Requirements:**
* The solution must run on a clean installation of the chosen operating system
* Jenkins and its prerequisites must be installed without a manual intervention.
* Jenkins must be configured to serve request over port 8000.

**Note:** It is not sufficient to forward port 8000 on either the host or the guest OS to the default jenkins port.  Jenkins itself must be configured to listen to port 8000.

## Setup - Automate the Build

### github repository

The solution leverages Vagrant and Puppet to orchestrate the answer to the technical challenge.  A GitHub repository at https://github.com/cdrobey/jenkins-puppet contains the vagrant and puppet agent configuration files.

Cloning the repository provides the simpliest path to succcess.  

```puppet
git clone https://github.com/cdrobey/jenkins-puppet.git
```
### vagrant configuration

The VagrantFile uses a native build of Ubuntu 16.04 LTS from the puppetlab vagrant repository.


https://atlas.hashicorp.com/puppetlabs/boxes/ubuntu-16.04-64-puppet

To pull the image and build the initial box, the following command execution is required.

```puppet
vagrant init puppetlabs/ubuntu-16.04-64-puppet
```

The VagrantFile configures the VM including mapping Port 8000 from the guest vm to the localhost network.  Additionally, Puppet manifest are loaded from the Vagrant shared folder and mapped to a manifest/module directory path.

### puppet configuration

Vagrant automates the steps to build the Jenkins server using puppet agent.  

The site.pp manifest uses a Jenkins class to setup an apt repository and install the Jenkins Server.  The steps to build the site.pp are located at https://wiki.jenkins-ci.org/display/JENKINS/Puppet.

The site.pp class integrates the port modifications from 8080->8000.  The services default start file is modified using commands from the stdlib module.