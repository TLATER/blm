#!/bin/bash
#
# Installs blm to default locations.

install -Do root -g root -m 0755 blm /usr/bin/blm
install -Do root -g root -m 0644 blm.conf /etc/blm/blm.conf
