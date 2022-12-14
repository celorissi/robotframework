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
    [Tags]             scs    internet    connection
    use genie testbed "${testbed}"
 
    connect to device "VV-SCS-N9K01"
    connect to device "VV-SCS-N9K02"

Profile Platform and Configuration
    [Documentation]    Get a snapshot of platform information e current configuration
    [Tags]             scs    internet    platform    configuration
    Profile the system for "platform;config" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/stable/stable_snapshot_platform"

Profile VLANs
    [Documentation]    Get a snapshot of vlan state
    [Tags]             scs    internet    vlan
    Profile the system for "vlan" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/stable/stable_snapshot_vlans"

Profile Interfaces
    [Documentation]    Get a snapshot of interfaces state
    [Tags]             scs    internet    interfaces
    Profile the system for "interface" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/stable/stable_snapshot_interfaces"

Profile VRFs
    [Documentation]    Get a snapshot of VRFs state
    [Tags]             scs    internet    vrf
    Profile the system for "vrf" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/stable/stable_snapshot_vrf"

Profile Routing Table
    [Documentation]    Get a snapshot of routing table entries
    [Tags]             scs    internet    routing
    Profile the system for "routing" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/stable/stable_snapshot_routing"

Profile BGP
    [Documentation]    Get a snapshot of BGF state
    [Tags]             scs    internet    bgp
    Profile the system for "bgp" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/stable/stable_snapshot_bgp"

Profile OSPF
    [Documentation]    Get a snapshot of OSPF state
    [Tags]             scs    internet    ospf
    Profile the system for "ospf" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/stable/stable_snapshot_ospf"
