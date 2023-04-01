#!/bin/bash

yum -y update
yum -y install httpd

ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
cat <<EOF > /var/www/html/index.html
<html>
<body>
    <h1> Site works </h1>
    <div>Server IP: $ip </div>
</body>
</html>
EOF
sudo service  httpd start
sudo chkconfig httpd on