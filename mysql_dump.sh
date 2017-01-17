er=root 
pass=root
RETVAL=0 
date=$(date +%Y-%m-%d%H)
cd $dir 
for i  in  confluence  jira7  rap sonarqube ;do 
    mysqldump -u$user -p$pass  --default-character-set=utf8 $i > ${i}_${date}.sql 
    RETVAL=$?
    if [ $RETVAL -eq 0 ];then
     echo -e "数据库备份完成 $i $date is ok " |mail -s "mysql备份通知"      wangxx@lianjintai.com   
   else
     echo -e "数据库备份失败 $i $date is error " |mail -s "mysql备份通知"   wangxx@lianjintai.com
     exit 2
   fi 
done 
exit $RETVAL


# 补充脚本
!/bin/bash 
dir=/data/backup/mysqlbackup
user=root 
pass=root
RETVAL=0 
date=`date +%Y-%m-%d_%H:%M:%S`
cd $dir 
docker exec -it  0086355458f0 mysqldump -uroot -proot --default-character-set=utf8 gitlab > /data/backup/mysqlbackup/gitlab_$date.sql
RETVAL=$?
 if [ $RETVAL -eq 0 ];then
    echo -e "数据库备份完成 gitlab $date is ok " |mail -s "mysql备份通知"   wangxx@lianjintai.com   
 else
    echo -e "数据库备份失败 gitlab $date is eroor " |mail -s "mysql备份通知"   wangxx@lianjintai.com
  exit 2
fi




