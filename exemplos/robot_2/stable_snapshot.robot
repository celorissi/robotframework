# Take a snapshot of the operational state of the device
# and save the output to a stable directory

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


Profile Configuration
    [Documentation]    Get a snapshot of platform information e current configuration
    [Tags]             equinix    platform    configuration
    Profile the system for "config" on devices "VV-DC1-EDGE-01" as "./reports/stable/stable_platform"
