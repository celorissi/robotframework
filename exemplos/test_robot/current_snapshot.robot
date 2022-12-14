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
    [Tags]             hortolandia
    use genie testbed "${testbed}"
 
    connect to device "VV-HOR-N9K01"
    connect to device "VV-HOR-N9K02"

Gather Platform and Configuration information
    [Documentation]    Get a snapshot of platform information e current configuration
    [Tags]             hortolandia    platform    configuration
    Profile the system for "platform;config" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "${outputdir}/current_platform"

Gather VLANs information
    [Documentation]    Get a snapshot of vlan state
    [Tags]             hortolandia    vlan
    Profile the system for "vlan" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "${outputdir}/current_vlans"

Gather Interfaces information
    [Documentation]    Get a snapshot of interfaces state
    [Tags]             hortolandia    interfaces
    Profile the system for "interface" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "${outputdir}/current_interfaces"

Gather VRFs information
    [Documentation]    Get a snapshot of VRFs state
    [Tags]             hortolandia    vrf
    Profile the system for "vrf" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "${outputdir}/current_vrf"

Gather Routing Table information
    [Documentation]    Get a snapshot of routing table entries
    [Tags]             hortolandia    routing
    Profile the system for "routing" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "${outputdir}/current_routing"

Gather BGP information
    [Documentation]    Get a snapshot of BGF state
    [Tags]             hortolandia    bgp
    Profile the system for "bgp" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "${outputdir}/current_bgp"

Gather OSPF information
    [Documentation]    Get a snapshot of OSPF state
    [Tags]             hortolandia    ospf
    Profile the system for "ospf" on devices "VV-HOR-N9K01;VV-HOR-N9K02" as "${outputdir}/current_ospf"




Compare Platform and Configuration
    [Documentation]    Compare the current platform information and configuration with stable
    [Tags]             hortolandia    platform    configuration
    Compare profile "./reports/stable/stable_platform" with "${outputdir}/current_platform" on devices "VV-HOR-N9K01;VV-HOR-N9K02"

Compare VLANs
    [Documentation]    Compare the current vlan state with stable
    [Tags]             hortolandia    vlan
    Compare profile "./reports/stable/stable_vlans" with "${outputdir}/current_vlans" on devices "VV-HOR-N9K01;VV-HOR-N9K02"

Compare Interfaces
    [Documentation]    Compare the current interfaces state with stable
    [Tags]             hortolandia    interfaces
    Compare profile "./reports/stable/stable_interfaces" with "${outputdir}/current_interfaces" on devices "VV-HOR-N9K01;VV-HOR-N9K02"

Compare VRFs
    [Documentation]    Compare the current VRFs state with stable
    [Tags]             hortolandia    vrf
    Compare profile "./reports/stable/stable_vrf" with "${outputdir}/current_vrf" on devices "VV-HOR-N9K01;VV-HOR-N9K02"

Compare Routing Table
    [Documentation]    Compare the current Routing Table state with stable
    [Tags]             hortolandia    routing
    Compare profile "./reports/stable/stable_routing" with "${outputdir}/current_routing" on devices "VV-HOR-N9K01;VV-HOR-N9K02"

Compare BGP
    [Documentation]    Compare the current BGP state with stable
    [Tags]             hortolandia    bgp
    Compare profile "./reports/stable/stable_bgp" with "${outputdir}/current_bgp" on devices "VV-HOR-N9K01;VV-HOR-N9K02"

Compare OSPF
    [Documentation]    Compare the current OSPF state with stable
    [Tags]             hortolandia    ospf
    Compare profile "./reports/stable/stable_ospf" with "${outputdir}/current_ospf" on devices "VV-HOR-N9K01;VV-HOR-N9K02"

