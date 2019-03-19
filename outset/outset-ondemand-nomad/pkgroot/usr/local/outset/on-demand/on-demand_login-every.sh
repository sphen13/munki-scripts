#!/bin/bash

# kill NoMAD
/usr/bin/killall NoMAD

# invoke login-once scripts during this on-demand run
/usr/local/outset/outset --login-every
