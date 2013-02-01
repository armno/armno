## PHPMyAdmin
> `http://localhost/phpmyadmin` is way too long. I want `http://pm.a` to fire up phpMyadmin.

(on Ubuntu 12.04)

```sh
$ cd /etc/apache2/sites-available
$ sudo vim pm.a
```

```
<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	ServerName pm.a
	DocumentRoot /usr/share/phpmyadmin
	<Directory /usr/share/phpmyadmin>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride all
		Order allow,deny
		allow from all
	</Directory>
</VirtualHost>
````

```sh
$ sudo a2ensite pm.a
$ sudo service apahce2 restart
```

### edit `hosts` file

```sh
$ sudo vim /etc/hosts
```

add this

```
127.0.0.1 pm.a
```

done!

