#!/bin/bash

# X Arch Linux Chinese Install
# -------------------------------
# 作者  : Jianrui Xu
#        https://github.com/CoderJxu
# 项目  : https://github.com/CoderJxu/JxArchLinux
# 证书  :
# 参考  : https://github.com/helmuthdu/aui
#        https://github.com/MatMoul/archfi
#        http://man.linuxde.net/tput
#        http://man.linuxde.net/tr
#        http://man.linuxde.net/fold
#        http://man.linuxde.net/sed
#        http://blog.csdn.net/jasonchen_gbd/article/details/53969450


# 定义常量
txtbacktitle="X Arch Linux的安装程序"


# tput 终端处理工具
# 获取终端的行数和列数
tCols=$(tput cols)
tLines=$(tput lines)
Bold=$(tput bold)
Underline=$(tput sgr 0 1)
Reset=$(tput sgr0)

# Regular Colors
Black=$(tput se)
Red=$(tput setaf 1)
Green=$(tput setaf 2)
Yellow=$(tput setaf 3)
Blue=$(tput setaf 4)
Purple=$(tput setaf 5)
Cyan=$(tput setaf 6)
White=$(tput setaf 7)
# Bold
BRed=${Bold}${Red}
BGreen=${Bold}${Green}
BYellow=${Bold}${Yellow}
BBlue=${Bold}${Blue}
BPurple=${Bold}${Purple}
BCyan=${Bold}${Cyan}
BWhite=${Bold}${white}



# ------------------------------------------------------------------------------

print_line(){
  printf "%${tCols}s\n"|tr ' ' '-'
}

print_title(){
  clear
  print_line
  echo -e "# ${Bold}$1${Reset}"
  print_line
  echo ""
}

print_info(){
  echo -e "${Bold}$1${Reset}\n" | fold -sw $(( $(tCols) - 18 )) | sed 's/^/\t/'
}

print_warning(){
  echo -e "${BYellow}$1${Reset}\n" | fold -sw $(( $(tCols) - 1 ))
}

print_danger(){
  echo -e "${BRed}$1${Reset}\n" | fold -sw $(( $(tCols) - 1 ))
}

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
  printmsg "当前系统的启动模式为 ${bootflag}"
}

# 系统设置
syssetup(){
  # # 更新系统时间
  # timedatectl set-ntp true
  #
  # # 中文本地化
  # echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
  # echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
  # locale-gen
  #
}

# 先决条件
prerequisite(){

  # roottest
  bootmode
  # syssetup


  # # 验证网络连接

}

# ------------------------------------------------------------------------------
prerequisite
exit 0
# ------------------------------------------------------------------------------
