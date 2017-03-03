# jenkins-puppet

#### Table of Contents


2. [Technical Challenge - Description](#technical-challenge)
3. [Setup - Use Vagrant to build an environment using Puppet](#setup)
    * [Vagrant Configuration](#vagrant-configuration)
    * [Puppet Manifest and Modules](#puppet-configuration)
4. [Questions](#questions)
    * [Implementation Hurdles](#implementation-hurdles)
    * [Importance of Ephemeral Builds](#rebuild)
    * [Information Hunt](#information-hunt)
    * [Value of Automation](#value-of-automation)

## Technical Challenge

Objective: Automate the installation and configuration of the jenkins CI server.

Requirements:
* The solution must run on a clean installation of the chosen operating system
* Jenkins and its prerequisites must be installed without a manual intervention.
* Jenkins must be configured to serve request over port 8000.

**Note:** It is not sufficient to forward port 8000 on either the host or the guest OS to the default jenkins port.  Jenkins itself must be configured to listen to port 8000.





### vagrant configuration

* Your system's `preferences` file and `preferences.d` directory
* Your system's `sources.list` file and `sources.list.d` directory
* System repositories
* Authentication keys

**Note:** This module offers `purge` parameters which, if set to 'true', **destroy** any configuration on the node's `sources.list(.d)` and `preferences(.d)` that you haven't declared through Puppet. The default for these parameters is 'false'.

### puppet configuration

To use the apt module with default parameters, declare the `apt` class.

```puppet
include apt
```

**Note:** The main `apt` class is required by all other classes, types, and defined types in this module. You must declare it whenever you use the module.
## Usage
