#!/bin/sh 

eval `ssh-agent`
ssh-add
exec bash
