
# 显示定时任务列表
           crontab -l

# 编辑定时列表
           crontab -e

# 每隔三天的6点30分重启服务器(wget)
           30 6 */3 * * /root/reboot.sh

# 每隔8个小时清理内存(wget)
           0 */8 * * * /root/free.sh



















