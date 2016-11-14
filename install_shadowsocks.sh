#! /bin/bash
cd /usr/local/src
wget https://pypi.python.org/packages/ba/2c/743df41bd6b3298706dfe91b0c7ecdc47f2dc1a3104abeb6e9aa4a45fa5d/ez_setup-0.9.tar.gz
wget https://pypi.python.org/packages/e7/a8/7556133689add8d1a54c0b14aeff0acb03c64707ce100ecd53934da1aa13/pip-8.1.2.tar.gz#md5=87083c0b9867963b29f7aba3613e8f4a
echo "install ez_setup-0.9"
tar -zxvf ez_setup-0.9.tar.gz
cd ez_setup-0.9
python ez_setup.py
python ez_setup.py install
cd ..
tar -zxvf pip-8.1.2.tar.gz
cd pip-8.1.2
python setup.py
python setup.py install
pip install shadowsocks
mkdir /etc/shadowsocks
cd /etc/shadowsocks
file="config.json"
echo -e "{" >> $file
echo -e "\t\"server\":\"0.0.0.0\"," >> $file
echo -e "\t\"local_address\":\"127.0.0.1\"," >> $file
echo -e "\t\"local_port\":1080," >> $file
echo -e "\t\"port_password\":{" >> $file
echo -e "\t\t\"1100\":\"wzsuper.com\"" >> $file
echo -e "\t}," >> $file
echo -e "\t\"timeout\":600," >> $file
echo -e "\t\"method\":\"aes-256-cfb\"," >> $file
echo -e "\t\"fast_open\":\"false\"" >> $file
echo -e "}" >> $file
ssserver -c /etc/shadowsocks/config.json -d start
echo "ssserver is started"
echo "config /etc/shadowsocks/config.json"
echo "log /var/log/shadowsocks.log"
echo "default port is 1100,passwd is wzsuper.com"
