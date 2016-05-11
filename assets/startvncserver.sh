#! /usr/bin/env bash
# since vncserver is running as a daemon, create a foreground vncserver for supervisord.

set -eu

USER=vncer
export USER

# Setting pidfile + command to execute
pidfile="/home/$USER/.vnc/*:0.pid"
command="/usr/bin/vncserver :0 -geometry 1366x768 -depth 24"


# Proxy signals
function kill_app(){
    kill $(cat $pidfile)
    exit 0 # exit okay
}
trap "kill_app" SIGINT SIGTERM

# Launch daemon
/etc/start-vnc-expect-script.sh

# Set password. $ROOTPASSWORD could be passed as ENV
VNC_PASSWORD_FILE=/home/$USER/.vnc/passwd
DEFAULT_ROOTPASSWORD=deleteme
if [ ${ROOTPASSWORD} ]; then
  echo $ROOTPASSWORD | vncpasswd -f > $VNC_PASSWORD_FILE
else
  echo $DEFAULT_ROOTPASSWORD | vncpasswd -f > $VNC_PASSWORD_FILE
fi
chmod 600 $VNC_PASSWORD_FILE

$command
sleep 2

# Loop while the pidfile and the process exist
while [ -f $pidfile ] && kill -0 $(cat $pidfile) ; do
    sleep 0.5
done
exit 1000 # exit unexpected
