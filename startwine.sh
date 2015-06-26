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

while :
do
    Xvfb -screen 0 800x600x16 &
    sleep 2
    x0vncserver -display $DISPLAY -passwordfile ~/.vnc/passwd -rfbport 5900 &
    wine start /max /d "/root/.wine/drive_c/windows/system32/" explorer.exe
    killall x0vncserver
    killall xvfb
done
