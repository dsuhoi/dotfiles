#!/bin/bash
for X in `find /sys/bus/hid/drivers/hid-multitouch -type l`; do
  if [[ $(udevadm info ${X}|grep "DRIVER=hid-multitouch") ]]; then
    basename ${X} | sudo tee  /sys/bus/hid/drivers/hid-multitouch/unbind
  fi
done
