Run the server with:

   docker run --rm -it --volume /tmp/.X11-unix:/tmp/.X11-unix -p 127.0.0.1:6030:6030 smartislav/xpra

run an application on the same host:

   DISPLAY=:30 xterm

connect to xpra from your workstation:

   xpra attach tcp:127.0.0.1:6030

