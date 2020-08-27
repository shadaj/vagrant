FROM ubuntu:18.04
ADD modules /puppet/modules
ADD manifests /puppet/manifests
RUN apt -y update
RUN apt -y install puppet
RUN useradd --create-home --home-dir /home/vagrant --user-group vagrant
RUN echo vagrant:vagrant | chpasswd
RUN echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN puppet apply /puppet/manifests/site.pp --modulepath /puppet/modules
USER vagrant
ENV HOME /home/vagrant
ENV SHELL /bin/bash
