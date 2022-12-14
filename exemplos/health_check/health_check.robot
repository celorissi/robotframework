# Take snapshot of the operational state of the device
# and compare with a good_snapshot

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

Gather Platform and Configuration information
    [Documentation]    Get a snapshot of platform information e current configuration
    [Tags]             scs    internet    platform    configuration
    Profile the system for "platform;config" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/current/current_snapshot_platform"

Gather VLANs information
    [Documentation]    Get a snapshot of vlan state
    [Tags]             scs    internet    vlan
    Profile the system for "vlan" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/current/current_snapshot_vlans"

Gather Interfaces information
    [Documentation]    Get a snapshot of interfaces state
    [Tags]             scs    internet    interfaces
    Profile the system for "interface" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/current/current_snapshot_interfaces"

Gather VRFs information
    [Documentation]    Get a snapshot of VRFs state
    [Tags]             scs    internet    vrf
    Profile the system for "vrf" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/current/current_snapshot_vrf"

Gather Routing Table information
    [Documentation]    Get a snapshot of routing table entries
    [Tags]             scs    internet    routing
    Profile the system for "routing" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/current/current_snapshot_routing"

Gather BGP information
    [Documentation]    Get a snapshot of BGF state
    [Tags]             scs    internet    bgp
    Profile the system for "bgp" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/current/current_snapshot_bgp"

Gather OSPF information
    [Documentation]    Get a snapshot of OSPF state
    [Tags]             scs    internet    ospf
    Profile the system for "ospf" on devices "VV-SCS-N9K01;VV-SCS-N9K02" as "./snapshots/current/current_snapshot_ospf"




Compare Platform and Configuration
    [Documentation]    Compare the current platform information and configuration with stable
    [Tags]             scs    internet    platform    configuration
    Compare profile "./snapshots/stable/stable_snapshot_platform" with "./snapshots/current/current_snapshot_platform" on devices "VV-SCS-N9K01;VV-SCS-N9K02"

Compare VLANs
    [Documentation]    Compare the current vlan state with stable
    [Tags]             scs    internet    vlan
    Compare profile "./snapshots/stable/stable_snapshot_vlans" with "./snapshots/current/current_snapshot_vlans" on devices "VV-SCS-N9K01;VV-SCS-N9K02"

Compare Interfaces
    [Documentation]    Compare the current interfaces state with stable
    [Tags]             scs    internet    interfaces
    Compare profile "./snapshots/stable/stable_snapshot_interfaces" with "./snapshots/current/current_snapshot_interfaces" on devices "VV-SCS-N9K01;VV-SCS-N9K02"

Compare VRFs
    [Documentation]    Compare the current VRFs state with stable
    [Tags]             scs    internet    vrf
    Compare profile "./snapshots/stable/stable_snapshot_vrf" with "./snapshots/current/current_snapshot_vrf" on devices "VV-SCS-N9K01;VV-SCS-N9K02"

Compare Routing Table
    [Documentation]    Compare the current Routing Table state with stable
    [Tags]             scs    internet    routing
    Compare profile "./snapshots/stable/stable_snapshot_routing" with "./snapshots/current/current_snapshot_routing" on devices "VV-SCS-N9K01;VV-SCS-N9K02"

Compare BGP
    [Documentation]    Compare the current BGP state with stable
    [Tags]             scs    internet    bgp
    Compare profile "./snapshots/stable/stable_snapshot_bgp" with "./snapshots/current/current_snapshot_bgp" on devices "VV-SCS-N9K01;VV-SCS-N9K02"

Compare OSPF
    [Documentation]    Compare the current OSPF state with stable
    [Tags]             scs    internet    ospf
    Compare profile "./snapshots/stable/stable_snapshot_ospf" with "./snapshots/current/current_snapshot_ospf" on devices "VV-SCS-N9K01;VV-SCS-N9K02"

