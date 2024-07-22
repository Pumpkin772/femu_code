#!/bin/bash
#----------------------------------------------------------------
#Script to dynamically config (enable/disable) FEMU features
#----------------------------------------------------------------

FEMU_FLIP_CMD_OPCODE="0Xef"

cmd=$1

if [[ $# != 1 ]]; then
    echo ""
    echo "Usage: $(basename $0) [1-4,8-9,13,19-20]"
    echo " Latency:"
    echo " 1 : enable_gc_delay,       2 : disable_gc_delay"
    echo " 3 : enable_delay_emu,      4 : disable_delay_emu"
    echo " 5 : reset_acct,            6 : enable_log"
    echo " 7 : disable_log,           8 : wap_statis"
    exit
fi

sudo nvme admin-passthru --opcode=${FEMU_FLIP_CMD_OPCODE} --cdw10=${cmd} /dev/nvme0n1
