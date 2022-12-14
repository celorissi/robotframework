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
    [Tags]             cd1088
    use genie testbed "${testbed}"
 
    connect to device "CD1088-SW05"
    connect to device "CD1088-SW11"
    connect to device "CD1088-SW12"
    connect to device "CD1088-SW13"
    connect to device "CD1088-SW14"
    connect to device "CD1088-SW15"
    connect to device "CD1088-SW16"
    connect to device "CD1088-SW17"
    connect to device "CD1088-SW18"
    connect to device "CD1088-SW19"
    connect to device "CD1088-SW20"
    connect to device "CD1088-SW21"
    connect to device "CD1088-SW22"
    connect to device "CD1088-SW23"
    connect to device "CD1088-SW24"
    connect to device "CD1088-SW25"
    connect to device "CD1088-SW26"

 
Gather Configuration information
    [Documentation]    Get a snapshot of platform information e current configuration
    [Tags]             cd1088    configuration
    Profile the system for "config" on devices "CD1088-SW05;CD1088-SW11;CD1088-SW12;CD1088-SW13;CD1088-SW14;CD1088-SW15;CD1088-SW16;CD1088-SW17;CD1088-SW18;CD1088-SW19;CD1088-SW20;CD1088-SW21;CD1088-SW22;CD1088-SW23;CD1088-SW24;CD1088-SW25;CD1088-SW26" as "${outputdir}/current_config"


Compare Configuration
    [Documentation]    Compare the current platform information and configuration with stable
    [Tags]             cd1088    configuration
    Compare profile "./snapshots/stable/stable_config" with "${outputdir}/current_config" on devices "CD1088-SW05;CD1088-SW11;CD1088-SW12;CD1088-SW13;CD1088-SW14;CD1088-SW15;CD1088-SW16;CD1088-SW17;CD1088-SW18;CD1088-SW19;CD1088-SW20;CD1088-SW21;CD1088-SW22;CD1088-SW23;CD1088-SW24;CD1088-SW25;CD1088-SW26"
