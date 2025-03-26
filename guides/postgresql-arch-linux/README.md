# Install PostgreSQl in Arch Linux

Update the system:
```
sudo pacman -Syu
```

Install PostgreSQL:
```
sudo pacman -S postgresql
```

PostgreSQL initialization:
```
sudo -u postgres initdb --locale en_US.UTF-8 -D /var/lib/postgres/data
```

PostgreSQL as a service:
```
sudo systemctl start postgresql
```

Initilization service at startup:
```
sudo systemctl enable postgresql
```

Check the version:
```
psql --version
```

Change to postgres user:
```
sudo -i -u postgres
```

Run PostgreSQL console:
```
psql
```

In the pgconsole create a new user, create a database and gran access:
```
CREATE USER myuser WITH PASSWORD 'mypassword';
CREATE DATABASE mydb;
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;
```

Set postgres password (optional):
```
ALTER USER postgres WITH PASSWORD 'postgres'; 
```

Exit:
```
\q
```

To return:
```
exit
```

DBeaver, Graphical admin suggestion:

```
sudo pacman -S dbeaver
```
