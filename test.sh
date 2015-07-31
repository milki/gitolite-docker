#!/bin/sh

echo "Starting sshd..."
service ssh start >/dev/null 2>&1

timeout=10
while ! service ssh status >/dev/null 2>&1
do
    timeout=$(($timeout - 1))
    if [ $timeout -eq 0 ]
    then
        echo Could not connect to ssh server. Aborting...
        exit 1
    fi
    echo Waiting for ssh server to accept connections...
    sleep 1
done
ssh-keyscan localhost >> /etc/ssh/ssh_known_hosts 2>/dev/null

export HOME=/home/g3
export USER=g3
export PATH=/home/g3/bin:$PATH

cd /home/g3/gitolite
echo Running: /usr/bin/prove $@...
setuidgid g3 /usr/bin/prove $@
