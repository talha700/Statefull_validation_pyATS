# Take initial snapshot of the operational state of the device
# and save the output to a file

*** Settings ***
# Importing test libraries, resource files and variable files.
Library        genie.libs.robot.GenieRobot
Library        pyats.robot.pyATSRobot


*** Variables ***
# Define the pyATS testbed file to use for this run
${testbed}     my_testbed.yaml 

*** Test Cases ***
# Creating test cases from available keywords.

Connect
    # Initializes the pyATS/Genie Testbed
    use genie testbed "${testbed}"

    # Connect to both device
    connect to device "R4-100"
    connect to device "R6-200"
    connect to device "R9-300"

Profile the devices
    Profile the system for "bgp;interface;ospf" on devices "R4-100;R6-200;R9-300" as "./new_snapshot"

Compare snapshots
    Compare profile "./good_snapshot" with "./new_snapshot" on devices "R4-100;R6-200;R9-300"