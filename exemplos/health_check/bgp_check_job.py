#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
from pyats.easypy import run


def main():
    bgp_checks = os.path.join('./bgp_neighbors.py')
    run(testscript=bgp_checks)
