# Take snapshot of the operational state of the device
# and compare with a stable snapshot

*** Settings ***
Library       ats.robot.pyATSRobot
Library       genie.libs.robot.GenieRobotJunos

*** Variables ***
${testbed}    ./inventory/testbed.yaml

*** Test Cases ***
Connect to devices
    [Documentation]    Define the hosts to connect and test connection
    [Tags]             equinix
    use genie testbed "${testbed}"
 
    connect to device "VV-DC1-EDGE-01"
 
Gather Configuration information
    [Documentation]    Get a snapshot of platform information e current configuration
    [Tags]             equinix    platform    configuration
    Profile the system for "config" on devices "VV-DC1-EDGE-01" as "${outputdir}/current_config"


Compare Configuration
    [Documentation]    Compare the current platform information and configuration with stable
    [Tags]             equinix    platform    configuration
    Compare profile "./reports/stable/stable_platform" with "${outputdir}/current_config" on devices "VV-DC1-EDGE-01"
