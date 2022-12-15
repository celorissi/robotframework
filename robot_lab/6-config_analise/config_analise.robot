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
    
Send show version
    ${output}=    execute "show version" on device "NXOS"
    Should Contain  ${output}    version 9.2(2)

Profile Configuracoes
    [Documentation]    Extraindo informacao de Configuracao
    [Tags]             Laboratorio    Configuracoes
    Profile the system for "config" on devices "NXOS" as "./reports/config"

Profile VLAN
    [Documentation]    Extraindo informacao de VLAN
    [Tags]             Laboratorio    vlan
    Profile the system for "vlan" on devices "NXOS" as "./reports/vlan"

Profile INTERFACE
    [Documentation]    Extraindo informacao de INTERFACE
    [Tags]             Laboratorio    interface
    Profile the system for "interface" on devices "NXOS" as "./reports/interface"

Verify the counts of 'up' Interace for NXOS
    verify count "7" "interface up" on device "NXOS"