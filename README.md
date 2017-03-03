# jenkins-puppet

#### Table of Contents


2. [Technical Challenge - Description](#technical-challenge)
3. [Setup - Use Vagrant to build an environment using Puppet](#setup)
    * [GitHub Repository](#github-repository)
    * [Puppet Manifest and Modules](#puppet-configuration)
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

### github repository

The solution leverages Vagrant and Puppet to orchestrate the answer to the technical challenge.  A GitHub repository at https://github.com/cdrobey/jenkins-puppet contains the vagrant and puppet agent configuration files.

Cloning the repository provides the simpliest path to succcess.  

```puppet
git clone https://github.com/cdrobey/jenkins-puppet.git
```
### vagrant configuration

The solution leverages Vagrant VirtualBox to build a base image with puppet integration.  The VagrantFile uses a native build of Ubuntu 16.04 LTS from the puppetlab vagrant repository.


https://atlas.hashicorp.com/puppetlabs/boxes/ubuntu-16.04-64-puppet

To pull the image and build the initial box, the following command execution is required.

```puppet
vagrant init puppetlabs/ubuntu-16.04-64-puppet
```

### puppet configuration

To use the apt module with default parameters, declare the `apt` class.

```puppet
include apt
```

**Note:** The main `apt` class is required by all other classes, types, and defined types in this module. You must declare it whenever you use the module.
## Usage
