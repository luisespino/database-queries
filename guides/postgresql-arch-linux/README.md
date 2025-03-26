# Install PostgreSQL on Arch Linux

#### 1. Update the system:
```
sudo pacman -Syu
```

#### 2. Install PostgreSQL:
```
sudo pacman -S postgresql
```

#### 3. Initialize PostgreSQL:
```
sudo -u postgres initdb --locale en_US.UTF-8 -D /var/lib/postgres/data
```

#### 4. Start PostgreSQL as a service:
```
sudo systemctl start postgresql
```

#### 5. Enable the service to start automatically at boot:
```
sudo systemctl enable postgresql
```

#### 6. Check the PostgreSQL version:
```
psql --version
```

#### 7. Switch to the postgres user:
```
sudo -i -u postgres
```

#### 8. Access the PostgreSQL console:
```
psql
```

#### 9. In the PostgreSQL console, create a new user, a new database, and grant access:
```
CREATE USER myuser WITH PASSWORD 'mypassword';
CREATE DATABASE mydb;
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;
```

#### 10. (Optional) Set a password for the postgres user:
```
ALTER USER postgres WITH PASSWORD 'postgres'; 
```

#### 11. Exit the PostgreSQL console:
```
\q
```

#### 12. To exit from the postgres user session:
```
exit
```

#### 13. DBeaver (Graphical admin tool) installation suggestion:
```
sudo pacman -S dbeaver
```
