
*** Settings ***
# Sourcing RobotFramework Keywords
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot

*** Variables ***
# Define the pyATS testbed file to use for this run
${testbed}     /home/marcelo/laboratorio/robotframework/robot_lab/inventory/testbed.yaml



*** Test Cases ***
# Creating test cases from available keywords.

Initialize
    # Initializes the pyATS/Genie Testbed
    # pyATS Testbed can be used within pyATS/Genie
    use genie testbed "${testbed}"

    # Connect to both device
    connect to device "NXOS"
 
    
# Verify OSPF neighbor counts CORRETO
Verify the counts of Ospf 'full' neighbors for NXOS
    verify count "1" "ospf neighbors" on device "NXOS"

# Verify OSPF neighbor counts ERRADO
Verify the counts of Ospf 'full' neighbors for NXOS
    verify count "2" "ospf neighbors" on device "NXOS"

# Verify Interfaces conectadas CORRETO
Verify the counts of 'up' Interace for NXOS
    verify count "7" "interface up" on device "NXOS"

# Verify Interfaces conectadas ERRADO
Verify the counts of 'up' Interace for NXOS
    verify count "9" "interface up" on device "NXOS"