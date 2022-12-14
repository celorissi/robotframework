# Take a snapshot of the operational state of the device
# and save the output to a stable directory

*** Settings ***
Library       ats.robot.pyATSRobot
Library       genie.libs.robot.GenieRobot

*** Variables ***
${testbed}    /home/marcelo/laboratorio/robotframework/robot_lab/inventory/testbed.yaml

*** Test Cases ***
Connect to devices
    [Documentation]    Define the hosts to connect and test connection
    [Tags]             Laboratorio
    use genie testbed "${testbed}"
 
    connect to device "NXOS"
