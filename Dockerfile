FROM alpine

ADD https://github.com/alexellis/faas/releases/download/0.5.8-alpha/fwatchdog /usr/bin

RUN chmod +x /usr/bin/fwatchdog

WORKDIR /root/

ENV fprocess="nslookup"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]
