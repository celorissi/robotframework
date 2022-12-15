*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot
Suite setup    Setup
Variables      OSPF.yaml

*** Variables ***
${testbed}    /home/marcelo/laboratorio/robotframework/robot_lab/inventory/testbed.yaml

*** Test Cases ***

IPv4 OSPF Neighborship CORRETO
    ${cmd}=    execute "show ip ospf neighbor" on device "NXOS"
    should contain  ${cmd}  192.168.15.213

IPv4 OSPF Neighborship INCORRETO
    ${cmd}=    execute "show ip ospf neighbor" on device "NXOS"
    should contain  ${cmd}  1.1.1.1
   


*** Keywords ***
Setup
    use testbed "/home/marcelo/laboratorio/robotframework/robot_lab/inventory/testbed.yaml"
    connect to all devices
