#!/bin/bash
echo "Cloning online yaksh from GitHub"
git clone https://github.com/rohmhatre/online_test.git
mkdir -p online_test/output online_test/yaksh/data
chmod -R 777 online_test/output online_test/yaksh/data

