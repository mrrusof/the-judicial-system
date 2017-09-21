#!/bin/bash

### BEGIN INIT INFO
# Provides:          tbop
# Required-Start:    docker
# Required-Stop:     docker
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: The Book of Problems
# Description:       The Book of Problems
### END INIT INFO

set -e

TBOP=/opt/tbop
TBOP_BIN=$TBOP/bin
TBOP_DESC='The Book of Problems'
export PATH=$PATH:$TBOP_BIN

test -f $TBOP_BIN/tbop-start.sh || exit 0
test -f $TBOP_BIN/tbop-stop.sh || exit 0
test -f $TBOP_BIN/tbop-status.sh || exit 0

. /lib/lsb/init-functions

fail_unless_root() {
    if [ "$(id -u)" != '0' ]; then
        log_failure_msg "$TBOP_DESC must be run as root"
        exit 1
    fi
}

case "$1" in
    start)
        fail_unless_root
        log_begin_msg "Starting $TBOP_DESC"
        tbop-start.sh
        log_end_msg $?
        ;;
    stop)
        fail_unless_root
        log_begin_msg "Stopping $TBOP_DESC"
        tbop-stop.sh
        log_end_msg $?
        ;;
    restart)
        fail_unless_root
        $0 stop
        $0 start
        ;;
    force-reload)
        fail_unless_root
        $0 restart
        ;;
    status)
        tbop-status.sh
        ;;
    *)
        echo "Usage: service tbop {start|stop|restart|status}"
        exit 1
        ;;
esac
