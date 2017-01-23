#判断服务是否开启
#cd到脚本所在路径
count=`ps aux| grep "dtensvc" | grep -v grep | wc -l`
if [[ $count -eq 0 ]]; then
pwd
echo `dirname $(pwd)/$0`
cd `dirname $(pwd)/$0`
./dtenrun ./mysetuid /bin/sh ./dtctl.sh
fi
