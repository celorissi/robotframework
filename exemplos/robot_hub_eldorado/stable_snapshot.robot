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
    [Tags]             Hub Eldorado
    use genie testbed "${testbed}"
 
    connect to device "HUB_VIA-A23-SW01"
    connect to device "HUB_VIA-A23-SW02"
    connect to device "HUB_VIA-A24-SW01"
    connect to device "HUB_VIA-A25-SW01"
    connect to device "HUB_VIA-A28-SW01"

Profile Configuration
    [Documentation]    Get a snapshot of platform information e current configuration
    [Tags]             Hub Eldorado   configuration
    Profile the system for "config" on devices "HUB_VIA-A23-SW01;HUB_VIA-A23-SW02;HUB_VIA-A24-SW01;HUB_VIA-A25-SW01;HUB_VIA-A28-SW01" as "./reports/stable/stable_config"
