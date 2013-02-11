# James

A command-line app which creates a VirtualHost in seconds in Ubuntu.

### usage

```sh
$ sudo james newsite.org
```

### behind the scences

- `cd /etc/apache2/sites-available`
- put in content

```
<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	ServerName $1
	DocumentRoot /var/www/$1
	<Directory /var/www/$1>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride all
		Order allow,deny
		allow from all
	</Directory>
</VirtualHost>
```

- `a2ensite $1`
- `service apache2 restart`