FROM debian:stable-slim

ADD https://github.com/openfaas/faas/releases/download/0.7.1/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog
    
COPY increment_version.sh /usr/bin/semver-increment-func
COPY func.sh /usr/bin/semver-increment

ENV fprocess="/usr/bin/semver-increment"
ENV write_debug="true"

HEALTHCHECK --interval=5s CMD [ -e /tmp/.lock ] || exit 1
CMD [ "fwatchdog" ]
