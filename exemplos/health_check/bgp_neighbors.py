#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# To get a logger for the script
import logging
import json
# To build the table at the end
from tabulate import tabulate

# Needed for aetest script
from ats import aetest
from ats.log.utils import banner

# Genie Imports
from genie.conf import Genie
from genie.abstract import Lookup

# import the genie libs
from genie.libs import ops # noqa

# Get your logger for your script
log = logging.getLogger(__name__)


###################################################################
#                  COMMON SETUP SECTION                           #
###################################################################
class common_setup(aetest.CommonSetup):
    # Connect to each device in the testbed
    @aetest.subsection
    def connect(self, testbed):
        genie_testbed = Genie.init(testbed)
        self.parent.parameters['testbed'] = genie_testbed
        device_list = []
        for device in genie_testbed.devices.values():
            log.info(banner(
                "Connect to device '{d}'".format(d=device.name)))
            try:
                device.connect()
            except Exception as e:
                self.failed("Failed to establish connection to '{}'".format(device.name))

            device_list.append(device)

        # Pass list of devices the to testcases
        self.parent.parameters.update(dev=device_list)


###################################################################
#                     TESTCASES SECTION                           #
###################################################################
class BGP_Neighbors_Established(aetest.Testcase):
    """ This is user Testcases section """

    # First test section
    @ aetest.test
    def learn_bgp(self):
        """ Sample test section. Only print """

        self.all_bgp_sessions = {}
        for dev in self.parent.parameters['dev']:
            log.info(banner("Gathering BGP Information from {}".format(dev.name)))
            abstract = Lookup.from_device(dev)
            bgp = abstract.ops.bgp.bgp.Bgp(dev)
            bgp.learn()
            self.all_bgp_sessions[dev.name] = bgp.info

    @ aetest.test
    def check_bgp(self):
        """ Sample test section. Only print """

        failed_dict = {}
        mega_tabular = []
        for device, bgp in self.all_bgp_sessions.items():
            # may need to change based on BGP config
            default = bgp['instance']['default']['vrf']['VRF-INTERNET']
            neighbors = default['neighbor']
            for nbr, props in neighbors.items():
                state = props.get('session_state')
                if state:
                    tr = []
                    tr.append(device)
                    tr.append(nbr)
                    tr.append(state)
                    if state.lower() == 'established':
                        tr.append('Passed')
                    else:
                        failed_dict[device] = {}
                        failed_dict[device][nbr] = props
                        tr.append('Failed')

                mega_tabular.append(tr)

        log.info(tabulate(mega_tabular,
                          headers=['Device', 'Peer', 'State', 'Pass/Fail'],
                          tablefmt='orgtbl'))

        if failed_dict:
            log.error(json.dumps(failed_dict, indent=3))
            self.failed("Testbed has BGP Neighbors that are not established")

        else:
            self.passed("All BGP Neighbors are established")


    @ aetest.test
    def check_critical_neighbor(self):
        # check especific if a critical neighbor is up
        critical_device = 'VV-SCS-N9K01'
        critical_neighbor = '131.100.118.3'
        neighbor_count = 0
        failed_dict = {}
        mega_tabular = []

        for device, bgp in self.all_bgp_sessions.items():
            default = bgp['instance']['default']['vrf']['VRF-INTERNET']
            neighbors = default['neighbor']
            if device == critical_device:
                for nbr, props in neighbors.items():
                    state = props.get('session_state')
                    if nbr == critical_neighbor:
                        if state:
                            tr = []
                            tr.append(device)
                            tr.append(nbr)
                            tr.append(state)
                            if state.lower() == 'established':
                                tr.append('Passed')
                                neighbor_count += 1
                            else:
                                failed_dict[device] = {}
                                failed_dict[device][nbr] = props
                                tr.append('Failed')

                        mega_tabular.append(tr)

        log.info(tabulate(mega_tabular,
                          headers=['Device', 'Peer', 'State', 'Pass/Fail'],
                          tablefmt='orgtbl'))

        if failed_dict or neighbor_count < 1:
            log.error(json.dumps(failed_dict, indent=3))
            self.failed("Testbed has critical BGP Neighbors that are not established")

        else:
            self.passed("All critical BGP Neighbors are established")

class Routing_Check(aetest.Testcase):

    @ aetest.test
    def learn_routing(self):
        self.all_routes = {}
        for dev in self.parent.parameters['dev']:
            log.info(banner("Gathering routing Information from {}".format(dev.name)))
            abstract = Lookup.from_device(dev)
            routing = abstract.ops.routing.routing.Routing(dev)
            routing.learn()
            self.all_routes[dev.name] = routing.info


    @ aetest.test
    def check_critical_routes(self):
        critical_route = '10.129.1.0/24'
        critical_found = 0
        mega_tabular = []

        for device, routing in self.all_routes.items():
            routes = routing['vrf']['default']['address_family']['ipv4']['routes']
            for route, props in routes.items():
                active = props.get('active')
                if route ==  critical_route:
                    critical_found += 1
                    tr = []
                    tr.append(device)
                    tr.append(route)
                    tr.append(active)
                    mega_tabular.append(tr)

        log.info(tabulate(mega_tabular,
                          headers=['Device', 'Route', 'Active'],
                          tablefmt='orgtbl'))


        if critical_found == 2:
            self.passed("All critical routes are actives")
        else:
            self.failed("Some critical routes are not found")


# #####################################################################
# ####                       COMMON CLEANUP SECTION                 ###
# #####################################################################
# This is how to create a CommonCleanup
# You can have 0 , or 1 CommonCleanup.
# CommonCleanup can be named whatever you want :)
class common_cleanup(aetest.CommonCleanup):
    """ Common Cleanup for Sample Test """

    # CommonCleanup follow exactly the same rule as CommonSetup regarding
    # subsection
    # You can have 1 to as many subsections as wanted
    # here is an example of 1 subsection

    @aetest.subsection
    def clean_everything(self):
        """ Common Cleanup Subsection """
        log.info("Aetest Common Cleanup ")


if __name__ == '__main__':
    aetest.main()
