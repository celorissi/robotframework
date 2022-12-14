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
    [Tags]             bartira    fabrica    connection
    use genie testbed "${testbed}"

    connect to device "BARTIRA-SW05"
    

Gather Platform and Configuration information
    [Documentation]    Get a snapshot of platform information e current configuration
    [Tags]             bartira    fabrica    platform    configuration
    Profile the system for "platform;config" on devices "BARTIRA-SW05" as "./snapshots/current/current_snapshot_platform"

Gather OSPF information
    [Documentation]    Get a snapshot of OSPF state
    [Tags]             bartira    fabrica    ospf
    Profile the system for "ospf" on devices "BARTIRA-SW05" as "./snapshots/current/current_snapshot_ospf"


Compare Platform and Configuration
    [Documentation]    Compare the current platform information and configuration with stable
    [Tags]             bartira    fabrica    platform    configuration
    Compare profile "./snapshots/current/stable_snapshot_platform" with "./snapshots/current/current_snapshot_platform" on devices "BARTIRA-SW05"

Compare OSPF
    [Documentation]    Compare the current OSPF state with stable
    [Tags]             bartira    fabrica    ospf
    Compare profile "./snapshots/current/stable_snapshot_ospf" with "./snapshots/current/current_snapshot_ospf" on devices "BARTIRA-SW05"

