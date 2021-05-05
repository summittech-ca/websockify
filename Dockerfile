FROM alpine
MAINTAINER Eric Bellotti <ericb@summit-tech.ca>

RUN apk add --no-cache --update-cache python3 py3-requests py3-numpy

COPY run /opt/websockify/
COPY websockify/ /opt/websockify/websockify/
COPY www/ /www/

# Expose two volumes to (possibly) host configuration files needed on the
# command line, e.g. keys and certificates for WSS access, files served for
# --web options, etc.
VOLUME /opt/websockify/data
VOLUME /opt/websockify/config

# Expose regular and encrypted standard web ports, you'll have to specify these
# in the command-line arguments.
EXPOSE 443
EXPOSE 80

ENTRYPOINT ["/opt/websockify/run"]
