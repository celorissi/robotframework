# Take a snapshot of the operational state of the device
# and save the output to a stable directory

*** Settings ***
Library       ats.robot.pyATSRobot
Library       genie.libs.robot.GenieRobot

*** Variables ***
${testbed}    ./inventory/testbed.yaml

*** Test Cases ***
Connect to devices
    [Documentation]    Define the hosts to connect and test connection
    [Tags]             Datacenter 
    use genie testbed "${testbed}"
 
    connect to device "VV-HOR-N9K01"
    connect to device "VV-HOR-N9K02"


Profile ARP
    [Documentation]    Extraindo informacao de ARP
    [Tags]             Datacenter    arp
    Profile the system for "arp" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "./snapshots/stable/stable_arp"

Profile VLAN
    [Documentation]    Extraindo informacao de VLAN
    [Tags]             Datacenter    vlan
    Profile the system for "vlan" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "./snapshots/stable/stable_vlan"