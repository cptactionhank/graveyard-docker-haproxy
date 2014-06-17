FROM ubuntu:trusty
MAINTAINER cptactionhank <cptactionhank@users.noreply.github.com>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61B9CD \
    && echo "deb http://ppa.launchpad.net/vbernat/haproxy-1.5/ubuntu $(lsb_release -cs) main" \
       > /etc/apt/sources.list.d/launchpad-vbernat-haproxy.list

RUN apt-get update -qq \
    && apt-get -yqq install haproxy

EXPOSE 80 443

VOLUME ["/etc/haproxy"]

CMD ["haproxy", "-f", "/etc/haproxy/haproxy.cfg"]
