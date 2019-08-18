FROM "ubuntu:16.04"

LABEL __copyright__="(C) Guido Draheim, licensed under the EUPL" \
      __version__="1.4.3325"
EXPOSE 80

RUN apt-get update
RUN apt-get install -y apache2 python
COPY files/docker/systemctl.py /usr/bin/systemctl
RUN test -L /bin/systemctl || ln -sf /usr/bin/systemctl /bin/systemctl

RUN echo TEST_OK > /var/www/html/index.html

RUN systemctl enable apache2
CMD ["/usr/bin/systemctl"]
