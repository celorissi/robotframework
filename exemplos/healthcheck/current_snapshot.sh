#!/bin/bash

TIMESTAMP=`date +%Y-%m-%d_%H-%M-%S`
OUTPUTDIR=/home/marcelo/robot_framework/healthcheck/reports/snapshot_$TIMESTAMP

mkdir $OUTPUTDIR

robot --outputdir $OUTPUTDIR --noncritical platform current_snapshot.robot