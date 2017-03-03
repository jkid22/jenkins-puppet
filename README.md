# jenkins-puppet

#### Table of Contents


2. [Technical Challenge - Description](#technical-challenge)
3. [Setup - Use Vagrant to build an environment using Puppet](#setup)
    * [Vagrant Configuration](#vagrant-configuration)
    * [Puppet Manifest and Modules](#puppet-configuration)
4. [Questions](#questions)
Describe the most difficult hurdle you had to overcome in implementing your solution.
Please explain why requirement (d) above is important.
Where did you go to find information to help you?
Briefly explain what automation means to you, and why it is important to an organization's infrastructure design strategy.
    * [Implementation Hurdles](#implementation-hurdles)
    * [Importance of Ephemeral Builds](#rebuild)
    * [Information Hunt](#information-hunt)
    * [Value of Automation](#value-of-automation)

## Technical Challenge

The apt module lets you use Puppet to manage Apt sources, keys, and other configuration options.

Apt (Advanced Package Tool) is a package manager available on Debian, Ubuntu, and several other operating systems. The apt module provides a series of classes, defines, types, and facts to help you automate Apt package management.

**Note**: For this module to correctly autodetect which version of Debian/Ubuntu (or derivative) you're running, you need to make sure the 'lsb-release' package is installed. We highly recommend you either make this part of your provisioning layer, if you run many Debian or derivative systems, or ensure that you have Facter 2.2.0 or later installed, which will pull this dependency in for you.

## Setup

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
