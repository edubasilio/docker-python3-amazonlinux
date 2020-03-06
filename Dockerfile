FROM basiliocode/amazonlinux:latest
RUN yum -y update

RUN yum -y install python3 python3-setuptools python3-pip
RUN pip3 install bpython pipenv

RUN yum -y clean all
