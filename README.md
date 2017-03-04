# jenkins-puppet

#### Table of Contents


2. [Technical Challenge](#technical-challenge)
3. [Automate the Build](#automate-the-build)
    * [github repository](#github-repository)
    * [vagrant configuration](#vagrant-configuration)
    * [puppet configuration](#puppet-configuration)

4. [Questions](#questions)
    * [Implementation Hurdles](#implementation-hurdles)
    * [Ephemeral Builds](#ephemeral-builds)
    * [Information Hunt](#information-hunt)
    * [Value of Automation](#value-of-automation)

## Technical Challenge

**Objective:** Automate the installation and configuration of the Jenkins CI server.

**Requirements:**
* The solution must run on a clean installation of the chosen operating system
* Jenkins and its prerequisites must be installed without a manual intervention.
* Jenkins must be configured to serve request over port 8000.

**Note:** It is not sufficient to forward port 8000 on either the host or the guest OS to the default jenkins port.  Jenkins itself must be configured to listen to port 8000.

## Automate the Build

All testing of the environment occured on Windows 10, Github Bash, and Vagrant.  The repository includes a bash script, install.sh, to download the repository and to start vagrant.

### github repository

A GitHub repository at https://github.com/cdrobey/jenkins-puppet contains the vagrant and puppet agent configuration files.

Cloning the repository provides the simpliest path to succcess.  

```puppet
git clone https://github.com/cdrobey/jenkins-puppet.git
```
### vagrant configuration

The VagrantFile uses a native build of Ubuntu 16.04 LTS from the puppetlab vagrant repository.  


https://atlas.hashicorp.com/puppetlabs/boxes/ubuntu-16.04-64-puppet

To pull the image and build the initial box, the following command execution is required.

```puppet
vagrant up
```

The VagrantFile configures the VM including mapping Port 8000 from the guest vm to the localhost network  (Note: This provides external access from the host, but the guest VM remaps port 8080 to 8000 in the /etc/default/jenkins file).  The Puppet manifest loads from the Vagrant shared folder during provider execution.

### puppet configuration

The site.pp manifest uses a Jenkins class to setup an apt repository and install the Jenkins Server.  The steps to build the site.pp are located at https://wiki.jenkins-ci.org/display/JENKINS/Puppet.

Additionally, the site.pp integrates the port modifications from 8080->8000.  The manifest uses the stdlib puppet module to change the default port setting in the configuration file, /etc/default/jenkins, to port 8000.


## Questions

###Implementation Hurdles

***Question:*** Describe the most difficult hurdle you had to overcome in implementing your solution.

I started the exercise by immersing myself in Vagrant documentation, since I had not used it.  After spending several hours on building a Vagrant environment in Windows, I started bootstrapping with Puppet.

I struggled with the idea of reusing puppet configuration code from the Jenkins Wiki.  My natural instinct led me to build the solution from the ground up.  Open Source encourages leveraging existing work to simplify the effort.  After recognizing my inhibition, I used example code as my starting point and added the required stdlib line changes to remap the port of the Jenkins Server.

The exercise quickly demonstrated the value of the collaborative nature of the Puppet Community and my need to overcome my conditioning from working in legacy companies. 

###Ephemeral Builds

***Question:*** Please explain why requirement (d) above is important.

The ability to reapply without error ensures a known good state across infrastructure devices.  Whether the system remains untouched or suffered signficiant change the reapplication of the configuration places the system into a pristine condition.  In the worse case scenario, a redeployed OS template/image allows CM pushes of code matching the original server.

By removing redundant configuration tasks the deployment speed increases, reduces the statiscal probability of error, and simplifies long-term device maintenance.  A regular workflow focused on refactoring code removes unwanted complexity and signficantly increases readability improving long-term maintainence. 



###Information Hunt

***Question:*** Where did you go to find information to help you?

I built my understanding of the tools and deployment steps using web resources.  Three sites filled gaps between my existing knowledge and new information needed complete the exercise:

https://github.com/patrickdlee/vagrant-examples - Vagrant/Puppet

https://docs.puppet.com/ - Puppet Documentaton and Commands

https://wiki.jenkins-ci.org/display/JENKINS/Install+Jenkins+with+Puppet - Puppet Jenkins and Ubuntu Load

###Value of Automation

***Question:*** Briefly explain what automation means to you, and why it is important to an organization's infrastructure design strategy.


The ability to drive consistency and simplicity throughout IT minimizes the surface area for failure.  Four key benefits arise from the ability to remove configuration drift in infrastructure.  

* Compliance - Provides controlled source code with documented changes for auditing
* Test - Assures all systems complete QA prior to production release using a repeatable process
* Sustainable - Allows the deployment and scaling of identical systems as capacity requirements change
* Documented - Provides a single source of truth across platform and software.  

These four characteristrics mechanize IT workflows to create a predictable long-term plan that generates higher velocity.