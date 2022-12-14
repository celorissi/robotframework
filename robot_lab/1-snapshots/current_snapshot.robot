# Take snapshot of the operational state of the device
# and compare with a stable snapshot

*** Settings ***
Library       ats.robot.pyATSRobot
Library       genie.libs.robot.GenieRobot

*** Variables ***
${testbed}    /home/marcelo/laboratorio/robotframework/robot_lab/inventory/testbed.yaml

*** Test Cases ***
Connect to devices
    [Documentation]    Define the hosts to connect and test connection
    [Tags]             Laboratorio
    use genie testbed "${testbed}"
 
    connect to device "NXOS"


 
Profile snapshot
    [Documentation]    Get a snapshot of platform information e current snapshot
    [Tags]             Laboratorio    snapshot
    Profile the system for "config" on devices "NXOS" as "${outputdir}/current_config"


Compare snapshot
    [Documentation]    Compare the current platform information and snapshot with stable
    [Tags]             Laboratorio    snapshot
    Compare profile "./reports/stable/stable_config" with "${outputdir}/current_config" on devices "NXOS"

