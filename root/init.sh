#!/bin/bash
cfgdir=/config
[[ ! -e $cfgdir/noxbit.cfg ]] && \
    cp /opt/noxbit/noxbit.cfg $cfgdir/noxbit.cfg

/opt/noxbit/STM-Hypervisor -config=$cfgdir/noxbit.cfg /uid=$1 /pass=$2
