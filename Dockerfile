FROM basiliocode/amazonlinux:latest
RUN yum -y update

RUN yum -y install wget git tree vim
RUN yum -y install python3 python3-setuptools python3-pip python3-dev py3-virtualenv
RUN pip3 install bpython poetry pipenv

RUN yum -y install zsh && sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

RUN yum -y clean all
CMD zsh
