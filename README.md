# The PE?P Stack

Phoenix Elixir Ember Postgresql, PEEP Stack, coined by [Justin McNally](https://medium.com/@j_mcnally) in a post on [Medium](https://medium.com/@j_mcnally/the-peep-stack-b7ba5afdd055)

## Overview
To deliver a stack template suitable for development on windows, mac or linux. Achieved via the use of Docker for a platform independent standard environment. Thats the plan!

### Which E?
The client side JS framework is awash with new concepts and forks of forks. For something known, I opted for E to represent Ember. It could and possibly will represent any ES6 JS *thing*. It's also entirely possible to avoid and just use Phoenix on it's own with Brunch to build assets, there are literally more options than fingers on your hands, you decide!

### Up & Running

Clone this repository, ensure requirements are in place, then run ```docker-compose up``` & grab a coffee as the build will take a while.

Once finished you should have four containers running. Your 'web', your 'api', a database and a dummy mailcatcher. Note they are on standard ports, so any local services will conflict!

Open ```http://localhost:4200``` for your web client and ```http://localhost:4200``` for phoenix. Enable your live reload then open your favorite editor and begin working on applications/client or applications/api.

### Steps to achieve a PE?P-Stack.

Because we want to run the commands and use our editors on our development machines, but not suffer the pain in building every time a system update update comes along...

* Install the visualization requirements ( listed below ).
* install ember-cli
* install elixir
* install phoenix

**Note** A chicken & egg scenario exists. You cannot run vagrant up, or docker-compose/dockuer build with a Dockerfile that has install or build steps based on none existent code, e.g. *npm install* Why? There is nothing to install if your client app folder is empty, as such and specifically npm will exit, causing the build to stop.

*So if starting from a totally empty applications tree, you'll need to have the 'tools' install locally, or alter the Dockerfile, skip the offending build, ssh in and run the necessary commands to create projects/manifests and so on.*

### Requirements

The requirements to run the peep stack is a docker compliant host OS, be that your own, or one provisioned by:
 * virtualbox ~ 5.0.4
 * vagrant ~ 1.7.4

Docker:
 * docker
 * docker-compose (fig)

Optionally locally:
  * ember-cli
  * elixir
  * phoenix
  * postgresql client


*Note: LiveReload is not that great when loaded through Vagrant, even with NFS. Better if you can support docker natively.*

To actively develop a project you will optionally require the following tools on your local development environment. Alternatively you can ssh into vagrant and run commands from that environment, which means your host OS should be free of any tooling like ember cli, phoenix. In practice we tend to have them on both for quick experiments and reference.


---

**Note** A chicken & egg scenario exists. You cannot run vagrant up with the a Dockerfile that has install or build steps, e.g. *npm install* Why? There is nothing to install if your client app folder is empty, as such and specifically npm will exit, causing vagrant to stop.

*So if starting from a totally empty project, you'll need to have the 'tools' install locally, or alter the Dockerfile to skip the build, ssh into vagrant, install run new commands and then restore the Dockerfile.*
