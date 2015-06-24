export DISPLAY=:0

su -c "chown winer -R /home/winer" root

mkdir ~/.vnc

VNC_PASSWORD_FILE=~/.vnc/passwd

DEFAULT_ROOTPASSWORD=changeme
if [ ${ROOTPASSWORD} ]; then
  echo $ROOTPASSWORD | vncpasswd -f > $VNC_PASSWORD_FILE
else
  echo $DEFAULT_ROOTPASSWORD | vncpasswd -f > $VNC_PASSWORD_FILE
fi
chmod 600 $VNC_PASSWORD_FILE

winetricks -q settings windowmanagerdecorated=n windowmanagermanaged=n
Xvfb -screen 0 800x600x16 &
x0vncserver -display $DISPLAY -passwordfile ~/.vnc/passwd -rfbport 5900 &