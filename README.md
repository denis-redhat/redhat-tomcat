# redhat-tomcat

Redhat-tomcat is an automated installer to deploy an Apache Tomcat Sample
application on a standalone Linux server.
This solution use Docker, Python and Ansible.
Post deployment unit test are embedded into the ansible playbook.
The installer is idempotent, so you can run it twice in a row and more without
any impact on the application.

## Prerequisites
  * A linux server with Docker, ansible, python2.7, pytest, pip and git installed
  * 8080/tcp port opened
  * An user with sudo permission (see below)

### Add sudo permission to your user
Follow these steps to add sudo permission to your Linux user:


On your Linux server with root user, create a sudo group:
```shell
# groupadd sudo
```
Then add this line into the /etc/sudoers file with visudo command:
```
%sudo	ALL=(ALL)	NOPASSWD: ALL
```
Add your user into this group:
```shell
# usermod -aG sudo YourUserName
```
Then, login on your user and refresh groups list:
```shell
$ newgrp sudo
```

## Install redhat-tomcat on your server
On your Linux server, follow these steps to install Apache Tomcat Sample
application:
```shell
$ git clone https://github.com/denis-redhat/redhat-tomcat.git
$ cd redhat-tomcat
$ ansible-playbook redhat-tomcat.yml
```

You can watch the apache tomcat sample page on http://localhost:8080/sample

Enjoy :)
