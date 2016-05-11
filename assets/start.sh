#!/usr/bin/env sh
set -e

export DISPLAY=:0

su -c "chown vncer -R /home/vncer" root

mkdir /home/vncer/.vnc

#start supervisor services (defined in ~/assets/supervisor/*.conf)
exec /usr/bin/supervisord -n

exit 0
