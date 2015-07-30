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

export HOME=/home/gtest
export USER=gtest
export PATH=/home/gtest/bin:$PATH

cd /home/gtest/gitolite
echo Running: /usr/bin/prove $@...
setuidgid gtest /usr/bin/prove $@
