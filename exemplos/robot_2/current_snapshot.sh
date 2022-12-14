#!/bin/bash

TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`
OUTPUTDIR=/home/marcelo/robot_framework/test_robot/reports/current/snapshot_$TIMESTAMP

mkdir $OUTPUTDIR

robot --outputdir $OUTPUTDIR --noncritical platform current_snapshot.robot
