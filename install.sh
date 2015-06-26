#!/bin/bash

install -d /usr/bin /etc
install -Dm755 src/blm /usr/bin
install -Dm644 src/blm.conf /etc/blm.conf
