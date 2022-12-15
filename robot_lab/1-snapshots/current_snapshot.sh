#!/bin/bash

TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`
OUTPUTDIR=/home/marcelo/laboratorio/robotframework/robot_lab/1-snapshots/reports/current/snapshot_$TIMESTAMP

mkdir $OUTPUTDIR

robot --outputdir $OUTPUTDIR current_snapshot.robot
