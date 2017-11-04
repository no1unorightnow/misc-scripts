#!/bin/bash

# I didn't like all the steps found here:
# http://www.orionscache.com/2014/01/clearing-arp-and-dns-cache-in-linux/
# so I made my own command:


arp -n | cut -d\  -f 1 | grep -v Add | sed 's/^/arp -d /g' | bash
