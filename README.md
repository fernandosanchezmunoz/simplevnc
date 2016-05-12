simplevnc
=====

Container image designed to provide interactive access to a minimalistic graphical interface through a VNC client.

Based on Alpine linux and a VNC server.

This container runs:

* Xvfb - X11 in a virtual framebuffer
* Tigervnc-server - A VNC server that scrapes the above X11 server
* Fluxbox - a small window manager

## Run It
* root  vnc password，**changeme**

    `docker run -d -p 5900:5900 fernandosanchez/simplevnc`

* root  vnc password，**ROOTPASSWORD**=mypassword

    `docker run -d -p 5900:5900 -e ROOTPASSWORD=<mypassword> fernandosanchez/simplevnc` 
