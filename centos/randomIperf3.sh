#!/bin/bash
# 随机iperf3测试脚本

# 定义测试服务器和端口
SERVER=$1
PORT=$2

# 定义测试时间
DURATION="60"

# 定义测试次数
TESTS="10000000000"

# 定义带宽范围
BANDWIDTH_MIN="100M"
BANDWIDTH_MAX="300M"

# 循环测试
for ((i=1; i<=$TESTS; i++))
do
	# 随机生成带宽
	BANDWIDTH=$(shuf -i $(echo $BANDWIDTH_MIN | tr -d '[:alpha:]')-$(echo $BANDWIDTH_MAX | tr -d '[:alpha:]') -n 1)
	BANDWIDTH="$BANDWIDTH$(echo $BANDWIDTH_MIN | tr -d '[:digit:]')"

     # 执行iperf3测试
     echo "Running test #$i with bandwidth $BANDWIDTH..."
     # 随机上传还是下载
     iperf3 -c $SERVER -p $PORT -t $DURATION -b $BANDWIDTH -R
     # rand=$((RANDOM % 2))

	#if [ $rand -eq 0 ]; then
	# iperf3 -c $SERVER -p $PORT -t $DURATION -b $BANDWIDTH -R
	#else
	# iperf3 -c $SERVER -p $PORT -t $DURATION -b $BANDWIDTH
	#fi
done

