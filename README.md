# Sonarr - https://sonarr.tv/

Latest stable Sonarr release from Arch Linux AUR

## Building the container yourself
To build this container, clone the repository and cd into it.

### Build it:
```
$ cd </repo/location>/docker-arch-sonarr
$ docker build -t="sonarr" .
```

### Permissions
To see the uid and gid of the default sonarr user and sonarr group within the container;
```
$ docker run sonarr /bin/bash -c 'getent group sonarr && id -u sonarr'
```

You'll probably want these IDs to match an external user/group on your system.
For instance, on my system, I'll chown all the sonarr storage/conf to media:media
The following command will update the sonarr user/group IDs in the container to match the IDs of the media user/group on my system
```
$ docker run -e USRID=`id -u media` -e GRPID=`getent group media | cut -d: -f3` sonarr /bin/bash -c 'usermod -u $USRID sonarr && groupmod -g $GRPID sonarr'
$ docker commit `docker ps -l -q -f IMAGE=sonarr` sonarr
```


### Run the container:

```
docker run -d -p 8989:8989 -p 9897:9897 --name=<container name> -v </your/storage/sonarr-data>:/data -v </your/storage/sonarr-config>:/var/lib/sonarr -v /etc/localtime:/etc/localtime:ro sonarr
```

```
http://<host ip>:8989
```


