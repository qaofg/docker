1、git私有仓库免密
需要将 .ssh 目录打包
Linux 下：
ssh-keygen -t rsa -C "youremail@example.com"
cd ~/
ls -al

cd .ssh
vim config
#取消弹出信息:Are you sure you want to continue connecting
Host *
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
# 只需要打.ssh隐藏目录，所以复制到一个空目录中
cp -r .ssh /home/zy
cd /home/zy
#由于.ssh是隐藏目录只能这样打包，
tar -zcvf ssh.tar .[!.]* 

2、将ssh.tar 放入docker中
ADD ssh.tar /root/