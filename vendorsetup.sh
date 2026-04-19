#!/bin/bash
# OrangeFox GKI Fragment Setup Script

# Modify bootconfig
printf "androidboot.force_normal_boot=0\nandroidboot.selinux=permissive\nkernel.rcu_nocbs=all\n" > device/lenovo/tb351fu/prebuilt/bootconfig
