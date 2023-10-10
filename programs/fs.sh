#!/bin/sh
# Fast Script
# Execute custom scripts rapidly
# Powered by Ayaka7452
# fs - root privilege edition

# Default path:
defop="/sdcard/.scripts"
# Import env:
defpath=`cat /data/binloader/configs/defpath`
modid=Fast_Script

init() {

 if [ ! -d $defop ]; then
  mkdir $defop
 fi

}

load() {
 
 if [ ! -f $defop/$1.sh ]; then
  echo "err: no such script"
  exit
 fi
 
 # dangerous command check
 cmd_chk=`cat $defop/$1.sh|grep rm`
 
 if [ -n "$cmd_chk" ]; then
  echo "err: 'rm' command is unsupported for safety reason"
  exit
 fi
 
 # require mark verity
 requsr=`cat $defop/$1.sh|grep req_user`
 case $requsr in
 "")
  # passed
  :
  ;;
 *)
  echo "err: this script only can be ran at user privilege"
  exit
  ;;
 esac
 
}

exec_cmd() {
 
 cp $defop/$1.sh $defpath/tmp/exec.sh
 chmod 0755 $defpath/tmp/exec.sh
 
 $defpath/tmp/exec.sh
 
 rm $defpath/tmp/exec.sh
 
}


# installs termod extension
inst_tmod() {

 # check if termod is installed
 inststate=`bpkg ls|grep Termod`
 case $inststate in
 "")
  echo "err: termod mod is not installed"
  exit
  ;;
 *)
  termod install $defpath/mods/$modid/tm_fs.tar
  ;;
 esac
 
 exit


}


help() {

 echo "FS - Executes custom script rapidly"
 echo "Usage: fs [name_of_script]"
 echo "Options:"
 echo "    tmfs - install fs termod edition"
 echo "Save scripts at: /sdcard/.scripts"
 echo "Powered by Ayaka7452"

}

# Command line responder:
case $1 in
help)
 help
;;
tmfs)
 inst_tmod
;;
"")
 echo "err: script name required"
;;
*)
 init
 load $1
 exec_cmd $1
;;
esac



