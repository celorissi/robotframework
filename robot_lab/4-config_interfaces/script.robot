*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot
Variables      Config.yaml
Suite setup    Setup

*** Variables ***
${testbed}    /home/marcelo/laboratorio/robotframework/robot_lab/inventory/testbed.yaml

*** Test Cases ***
Send show version
    ${output}=    execute "show version" on device "NXOS"
    Should Contain  ${output}    version 9.2(2)
    Should Contain  ${output}    version 9.2(1)

Change interface description
    configure "interface e1/3\ndescription testeint" on device "NXOS"

Verify interface description
    ${output}=    execute "show running interface e1/3" on device "NXOS"
    Should Contain  ${output}    testeint

Change configuration from yaml file
    configure "${config_interface}" on device "NXOS"

Count ospf neighbor
    ${output}=    execute "show ip ospf neighbor" on device "NXOS"
    Should Contain X Times  ${output}  FULL  1

*** Keywords ***
Setup
    use genie testbed "${testbed}"
    connect to devices "NXOS"

