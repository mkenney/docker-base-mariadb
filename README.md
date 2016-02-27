```
db:
    image: mkenney/base-mariadb:latest
    container_name: mariadb
    ports:
        - "3306"
    hostname: mkenney-base-mariadb
    volumes:
        - ./data:/var/lib/mysql/ # Mysql data files
        - /etc/localtime:/etc/localtime:ro
    environment:
        - server_env=dev
        - is_docker=1
```
