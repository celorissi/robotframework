#!/bin/bash

TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`
OUTPUTDIR=/home/marcelo/estudos/devnet/robot_framework/robot_datacenter/snapshots/current/snapshot_$TIMESTAMP

mkdir $OUTPUTDIR

robot --outputdir $OUTPUTDIR current_snapshot.robot
