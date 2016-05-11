#!/usr/bin/env sh
set -e

export DISPLAY=:0

su -c "chown vncer -R /home/vncer" root

mkdir /home/vncer/.vnc

VNC_PASSWORD_FILE=/home/vncer/.vnc/passwd

DEFAULT_ROOTPASSWORD=realmadrid
if [ ${ROOTPASSWORD} ]; then
  echo $ROOTPASSWORD | vncpasswd -f > $VNC_PASSWORD_FILE
else
  echo $DEFAULT_ROOTPASSWORD | vncpasswd -f > $VNC_PASSWORD_FILE
fi
chmod 600 $VNC_PASSWORD_FILE

#startxfce4

exec /usr/bin/supervisord -n

exit 0
