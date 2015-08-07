# Sonarr - https://sonarr.tv/

Latest stable Sonarr release from Arch Linux AUR

## Building the container yourself
To build this container, clone the repository and cd into it.

### Build it:
```
$ cd </repo/location>/docker-arch-sonarr
$ docker build -t="sonarr" .
```

### Run the container:

```
docker run -d -p 8989:8989 -p 9897:9897 --name=<container name> -v </your/storage/sonarr-data>:/data -v </your/storage/sonarr-config>:/var/lib/sonarr -v /etc/localtime:/etc/localtime:ro sonarr
```

```
http://<host ip>:8989
```


