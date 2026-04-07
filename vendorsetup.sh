#!/bin/bash
# Automatically clean up the problematic root/vendor directory before each build
# This fixes the rsync error 'could not make way for new symlink'
rm -rf out/target/product/TB351FU/root/vendor
rm -rf out/target/product/TB351FU/recovery/root/vendor
