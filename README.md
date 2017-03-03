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

All testing of the environment occured on Windows 10, Github Bash, and Vagrant.

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


## Questions

###Implementation Hurdles

***Question:*** Describe the most difficult hurdle you had to overcome in implementing your solution.

I started the exercise by immersing myself in Vagrant documentation to familiarize myself with its capabilities.  After spending several hours on building a Vagrant environment in Windows, I started to focus on integrating the answer into Puppet.

I struggled with the idea of reusing puppet configuration code from the Jenkins Wiki as the basis for building my site.pp.  My natural instinct of working on a technical challenge requires building a solution from the ground up.  Open Source encourages leveraging existing work to create velocity to simplify the amount of work.  After recognizing my inhibition, I quickly added the changed required for port remapping of the Jenkins Server.

The exercise quickly demonstrated the value of the collaborative nature of the Puppet Community and my need to overcome my conditioning from working in legacy companies. 


###Importance of Ephemeral Builds

***Question:*** Please explain why requirement (d) above is important.

The ability to reapply without error ensures a known good state across infrastructure devices.  By removing redundant configuration tasks the deployment speed increases, reduces the statiscal probability for error, and simplifies long-term code maintenance. 



###Information Hunt

***Question:*** Where did you go to find information to help you?

I built my understanding of the tools and deployment steps using web resources.  I used three sites to build the majority of my expertise:

https://github.com/patrickdlee/vagrant-examples - Vagrant/Puppet
https://docs.puppet.com/ - Puppet Documentaton and Commands
https://wiki.jenkins-ci.org/display/JENKINS/Install+Jenkins+with+Puppet - Puppet Jenkins and Ubuntu Load

###Value of Automation

***Question:*** Briefly explain what automation means to you, and why it is important to an organization's infrastructure design strategy.


The ability to drive consistency and simplicity throughout IT minimizes the surface area for failure.  Four key benefit arise from the ability to re-apply configuration without error and minimize drift.  

*Compliance - Provides measurable and documented control with source code control
*Test - Assures all systems are QAed prior to production release with repeatable delivery process
*Sustainable - Allows the deployment and scaling of identical system as capacity requirements develop
*Documented - Provides a single source of truth across platform and software.  

Mechanizing change management aligns the management team to a predictable long-term plan and generates higher velocity.


