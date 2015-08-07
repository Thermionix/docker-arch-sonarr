FROM base/archlinux
MAINTAINER thermionix

RUN		pacman-key --refresh-keys
RUN		pacman -Syu --noconfirm
RUN		pacman-db-upgrade
RUN		pacman -S --needed --noconfirm supervisor base-devel
RUN		pacman -S --needed --noconfirm mono libmediainfo sqlite

USER 	nobody
RUN 	curl https://aur.archlinux.org/packages/so/sonarr/sonarr.tar.gz | tar zx -C /tmp
RUN 	cd /tmp/sonarr ; makepkg --noconfirm

USER 	root
RUN		pacman -U /tmp/sonarr/sonarr*.tar.xz --noconfirm
RUN		rm -rf /tmp/sonarr

RUN		pacman -Scc --noconfirm

ADD		sonarr.ini /etc/supervisor.d/sonarr.ini

VOLUME ["/data"]
VOLUME ["/var/lib/sonarr"]
VOLUME ["/media"]

EXPOSE 8989
EXPOSE 9897

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]

