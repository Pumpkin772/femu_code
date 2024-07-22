#!/bin/bash

# 设置初始偏移量为0
offset=0

# 进行15次写操作
for i in {1..15}
do
  # 生成随机的写入大小，范围在1000000KB到1200000KB之间
  size=$(shuf -i 1000000-1200000 -n 1)k

  # 使用fio进行写操作
  fio --name=write_test --filename=/dev/nvme0n1 --rw=write --bs=4k --size=$size --offset=${offset}k --numjobs=1 --time_based --runtime=60 --group_reporting

  # 增加偏移量788KB
  offset=$((offset + 788))
done
