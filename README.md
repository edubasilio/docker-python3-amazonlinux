# Amazon Linux 2 with Python 3
![GitHub last commit](https://img.shields.io/github/last-commit/edubasilio/docker-python3-amazonlinux?style=plastic)
![Docker Automated build](https://img.shields.io/docker/automated/basiliocode/python3-amazonlinux?style=plastic)
![MicroBadger Layers](https://img.shields.io/microbadger/layers/basiliocode/python3-amazonlinux?style=plastic)
![MicroBadger Size](https://img.shields.io/microbadger/image-size/basiliocode/python3-amazonlinux?style=plastic)

[Amazon Linux 2 with Python 3](https://hub.docker.com/repository/docker/basiliocode/python3-amazonlinux) and:
* python3-setuptools
* python3-pip
* pip3
* bpython
* pipenv

### Dockerfile
If you choose to use these images it is highly recommended that you include `RUN yum -y update && yum clean all` in your _Dockerfile_

#### Enable services
Add the line `RUN systemctl enable app.service` to enable a app.
e.g:
```dockerfile
RUN amazon-linux-extras install -y nginx1
RUN systemctl enable nginx.service
```

### Running a systemd enabled app container
In order to run a container with systemd, you will need to mount the cgroups volumes from the host. Below is an example command that will run the systemd enabled httpd container created earlier.

```sh
docker run -ti -v /sys/fs/cgroup:/sys/fs/cgroup:ro basiliocode/python3-amazonlinux bash
```

This container is running with systemd in a limited context, with the cgroups filesystem mounted. There have been reports that if you're using an Ubuntu host, you will need to add `-v /tmp/$(mktemp -d):/run` in addition to the cgroups mount.
