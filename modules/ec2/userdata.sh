#!/bin/bash
yum update -y
amazon-linux-extras install -y php7.4
yum install -y httpd php php-mysqlnd mariadb
systemctl enable httpd
systemctl start httpd

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz

cat > wp-config.php <<EOF
<?php
define('DB_NAME', '${db_name}');
define('DB_USER', '${db_user}');
define('DB_PASSWORD', '${db_password}');
define('DB_HOST', '${db_endpoint}');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
EOF

chown -R apache:apache /var/www/html
