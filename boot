#!/bin/bash
killall aria2c
sleep 3
aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all -c -D
