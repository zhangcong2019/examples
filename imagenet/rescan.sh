#!/bin/bash

 

for i in 18 42 6c 96

 

do
        Sguint_port=0000:$i:00.0
        PF_BAR=$(setpci -s $Sguint_port 429.b)
        echo "Current PF Bar size:" $PF_BAR
        New_PF_BAR=0x0e
        setpci -s $Sguint_port 429.b=$New_PF_BAR
        sleep 1
        PF_BAR=$(setpci -s $Sguint_port 429.b)
        echo "PF Bar size set to 16GB:" $PF_BAR
        echo -n "$Sguint_port" > /sys/bus/pci/drivers/i915/unbind
        sleep 5
done

 

echo 1 > /sys/bus/pci/devices/0000:15:01.0/remove
echo 1 > /sys/bus/pci/devices/0000:3f:01.0/remove
echo 1 > /sys/bus/pci/devices/0000:69:01.0/remove
echo 1 > /sys/bus/pci/devices/0000:93:01.0/remove

 

sleep 5

 

echo 1 > /sys/bus/pci/rescan
