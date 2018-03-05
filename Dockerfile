FROM ubuntu:artful

MAINTAINER Ilya Epifanov <elijah.epifanov@gmail.com>

RUN apt-get update \
 && apt-get install -y curl gnupg software-properties-common --no-install-recommends \
 && curl http://winswitch.org/gpg.asc | apt-key add - \
 && echo "deb http://winswitch.org/ artful main" > /etc/apt/sources.list.d/winswitch.list \
 && add-apt-repository universe \
 && apt-get update \
 && apt-get install -y xpra gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly python-gst-1.0 python-lzo python-yaml --no-install-recommends \
 && apt-get remove -y curl gnupg software-properties-common \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME "/tmp/.X11-unix"
EXPOSE 6030

CMD ["/usr/bin/xpra", "start", "--bind-tcp=0.0.0.0:6030", ":30", "--daemon=no"]
