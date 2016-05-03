
# s2i-draft
#FROM openshift/base-centos7
FROM ubuntu:14.04

# TODO: Put the maintainer name in the image metadata
MAINTAINER Mency Woo <mency.woo@gmail.com>

# TODO: Rename the builder environment variable to inform users about application you provide them
ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
#LABEL io.k8s.description="Platform for building xyz" \
#      io.k8s.display-name="builder x.y.z" \
#      io.openshift.expose-services="8080:http" \
#      io.openshift.tags="builder,x.y.z,etc."



COPY ./webapp/requirements.txt /tmp/requirements.txt

# TODO: Install required packages here:
RUN yum install -y ... && yum clean all -y
RUN pip install -qr /tmp/requirements.txt


FROM ubuntu:14.04
MAINTAINER Docker Education Team <education@docker.com>
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
ADD ./webapp/requirements.txt /tmp/requirements.txt
RUN pip install -qr /tmp/requirements.txt
ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp
EXPOSE 5000
CMD ["python", "app.py"]
