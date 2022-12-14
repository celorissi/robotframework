# Take snapshot of the operational state of the device
# and compare with a stable snapshot

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
    [Documentation]    Get a snapshot of platform information e current configuration
    [Tags]             Datacenter    arp
    Profile the system for "arp" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "${outputdir}/current_config"

Profile VLAN
    [Documentation]    Extraindo informacao de VLAN
    [Tags]             Datacenter    vlan
    Profile the system for "vlan" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "./snapshots/stable/stable_vlan"

Compare Configuration
    [Documentation]    Compare the current platform information and configuration with stable
    [Tags]             Datacenter    arp
    Compare profile "./snapshots/stable/stable_arp" with "${outputdir}/current_config" on devices "VV-HOR-N9K01;VV-HOR-N9K02"

Compare Configuration
    [Documentation]    Compare the current platform information and configuration with stable
    [Tags]             Datacenter    vlan
    Compare profile "./snapshots/stable/stable_vlan" with "${outputdir}/current_config" on devices "VV-HOR-N9K01;VV-HOR-N9K02"
