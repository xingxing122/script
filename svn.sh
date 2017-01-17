#!/bin/bash 
svn_bak=/data/backup/svnbackup
svn_dir=/data/svndata/test 
date=`date +%Y-%m-%d_%H:%M:%S`
echo "0" >/tmp/svnid 
id1=$(cat /tmp/svnid)
id2=$(svnlook youngest $svn_dir)

#  svn bakcup 
svnadmin dump $svn_dir -r $id1:$id2 --incremental > $svn_bak/svn_$date
RETVAL=$?
 if [ $RETVAL -eq 0 ];then
    echo -e "svn 备份完成  $id1:$id2   $date is ok " |mail -s "svn 备份通知"   wangxx@lianjintai.com   
 else
    echo -e "svn 备份失败 $id1:$id2  $date is eroor " |mail -s "svn 备份通知"   wangxx@lianjintai.com
  exit 2
fi

