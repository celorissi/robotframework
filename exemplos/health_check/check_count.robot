
*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot

*** Variables ***
${testbed}     ./inventory/testbed.yaml

*** Test Cases ***
Connect to devices
    use genie testbed "${testbed}"
    connect to device "VV-SCS-N9K02"

    #log to console    Trigger - ${trigger_datafile}
    #log to console    Verification - ${verification_datafile}
    #log to console    Datafile - ${datafile}

Verify OSPF neighbor count
    verify count "2" "ospf neighbors" on device "VV-SCS-N9K02"

Verify BGP neighbor count
    verify count "2" "bgp neighbors" on device "VV-SCS-N9K02"

Verify BGP route count
    verify count "5" "bgp routes" on device "VV-SCS-N9K02"
