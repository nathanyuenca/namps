Docker example of Apache with ssl, MySql 5.6, PhpMyAdmin and Php 7.0

Installation:

$ git clone https://gitlab.com/nathanyuen/namps.git  
$ cd namps  
$ docker-compose up  

Example:

Visit php example with http at [http://localhost](http://localhost)  
Visit php example with https at [https://localhost](https://localhost)  
Visit phpmyadmin at [http://localhost:81](http://localhost:81)  

Settings:

You can change all settings as MySql version, ports, user, password in .evn file except PHP version.  
You can just change PHP verssion in Dockerfile.  

Enjoy !
