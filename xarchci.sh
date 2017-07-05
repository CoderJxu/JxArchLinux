#!/bin/bash

# X Arch Linux Chinese Install
# -------------------------------
# 作者  : Jianrui Xu
#        https://github.com/CoderJxu
# 项目  : https://github.com/CoderJxu/JxArchLinux
# 证书  :
# 参考  :

# 定义常量
txtbacktitle="X Arch Linux的安装程序"

# ------------------------------------------------------------------------------
# 信息提示
printmsg(){
  # echo -e 处理特殊字符
  echo -ne "[xarchci]  "
  echo -e "$1\n"
}

# 验证权限
roottest(){
  if [ "`id -u`" -ne 0 ]
    printmsg "root 已登录......"
  then
    printmsg "请用 root 登录！"
    exit -1
  fi
}

# 验证启动模式
bootmode(){
  if [ -d /sys/firmware/efi/ ]; then
    bootflag="UEFI"
  else
    bootflag="BIOS"
  fi
  printmsg "当前系统的启动模式为 $bootflag"
}

# 先决条件
prerequisite(){

  # roottest
  bootmode

  # # 更新系统时间
  # timedatectl set-ntp true
  #
  # # 中文本地化
  # echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
  # echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
  # locale-gen
  #
  #


  # # 验证网络连接

}

# ------------------------------------------------------------------------------
prerequisite
exit 0
# ------------------------------------------------------------------------------
