docker-alpine-vnc-wine
=====

This container runs:

* Xvfb - X11 in a virtual framebuffer
* Tigervnc-server - A VNC server that scrapes the above X11 server
* Fluxbox - a small window manager
* Explorer.exe - to demo that it works

 
[catataw/alpine-vnc-wine](https://registry.hub.docker.com/u/catataw/alpine-vnc-wine/) docker image
## Run It
* root  vnc password，**changeme**

    `docker run -d -p 5900:5900 catataw/alpine-vnc-wine`

* root  vnc password，**ROOTPASSWORD**=mypassword

    `docker run -d -p 5900:5900 -e ROOTPASSWORD=<mypassword> catataw/alpine-vnc-wine` 
