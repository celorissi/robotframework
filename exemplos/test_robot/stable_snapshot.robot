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
    [Tags]             hortolandia
    use genie testbed "${testbed}"
 
    connect to device "VV-HOR-N9K01"
    connect to device "VV-HOR-N9K02"

Profile Platform and Configuration
    [Documentation]    Get a snapshot of platform information e current configuration
    [Tags]             hortolandia    platform    configuration
    Profile the system for "platform;config" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "./reports/stable/stable_platform"

Profile VLANs
    [Documentation]    Get a snapshot of vlan state
    [Tags]             hortolandia    vlan
    Profile the system for "vlan" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "./reports/stable/stable_vlans"

Profile Interfaces
    [Documentation]    Get a snapshot of interfaces state
    [Tags]             hortolandia    interfaces
    Profile the system for "interface" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "./reports/stable/stable_interfaces"

Profile VRFs
    [Documentation]    Get a snapshot of VRFs state
    [Tags]             hortolandia    vrf
    Profile the system for "vrf" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "./reports/stable/stable_vrf"

Profile Routing Table
    [Documentation]    Get a snapshot of routing table entries
    [Tags]             hortolandia    routing
    Profile the system for "routing" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "./reports/stable/stable_routing"

Profile BGP
    [Documentation]    Get a snapshot of BGF state
    [Tags]             hortolandia    bgp
    Profile the system for "bgp" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "./reports/stable/stable_bgp"

Profile OSPF
    [Documentation]    Get a snapshot of OSPF state
    [Tags]             hortolandia    ospf
    Profile the system for "ospf" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "./reports/stable/stable_ospf"

