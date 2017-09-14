FROM ubuntu:14.04

MAINTAINER Michaël Rigart <michael@netronix.be>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "====> Adding Ansible's PPA... <===="  && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee /etc/apt/sources.list.d/ansible.list           && \
    echo "deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/ansible.list    && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7BB9C367    && \
    apt-get update  && \
    \
    \
    echo "====> Installing Git... <====" && \
    apt-get install -y git && \
    \
    \
    echo "====> Installing Ansible... <===="  && \
    apt-get install -y ansible  && \
    \
    \
    echo "====> Removing Ansible PPA... <===="  && \
    rm -rf /var/lib/apt/lists/*  /etc/apt/sources.list.d/ansible.list

CMD [ "ansible-playbook", "--version" ]

