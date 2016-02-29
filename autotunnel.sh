#!/bin/sh

REMOTEUSER=basepi
REMOTEHOST=basepi.net

SSH_REMOTEPORT=22
SSH_LOCALPORT=10022

TUNNEL1_LOCALPORT=6789
TUNNEL1_REMOTEHOST=basepi.net
TUNNEL1_REMOTEPORT=6789

TUNNEL2_LOCALPORT=6788
TUNNEL2_REMOTEHOST=basepi.net
TUNNEL2_REMOTEPORT=6667

createTunnel() {
    /usr/bin/ssh -f -N  -L$SSH_LOCALPORT:$REMOTEHOST:$SSH_REMOTEPORT -L$TUNNEL1_LOCALPORT:$TUNNEL1_REMOTEHOST:$TUNNEL1_REMOTEPORT -L$TUNNEL2_LOCALPORT:$TUNNEL2_REMOTEHOST:$TUNNEL2_REMOTEPORT $REMOTEUSER@$REMOTEHOST
    if [[ $? -eq 0 ]]; then
        echo Tunnel to $REMOTEHOST created successfully
    else
        echo An error occurred creating a tunnel to $REMOTEHOST RC was $?
    fi
}

## Run the 'ls' command remotely.  If it returns non-zero, then create a new connection
/usr/bin/ssh -p $SSH_LOCALPORT $REMOTEUSER@localhost ls >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
    echo Creating new tunnel connection
    createTunnel
fi
