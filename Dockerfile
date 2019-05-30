FROM library/fedora:28
MAINTAINER Nikita Kretov <kretov995@gmail.com>
ENV SPECSDIR /specs
RUN yum clean all \
  && yum update -y \
  && yum install -y rpmlint \
  && yum clean all \
  && useradd -c 'RPM linter' linter
COPY rpmlinter /bin/
USER linter
WORKDIR /home/linter
ENTRYPOINT ["/bin/rpmlinter"]
