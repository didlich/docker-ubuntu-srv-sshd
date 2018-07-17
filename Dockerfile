FROM ubuntu:18.04

MAINTAINER didlich <didlich@e.mail.net>

# ------------------------
# SSH Server support
# ------------------------
RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd

COPY sshd_config /etc/ssh/

EXPOSE 2222 80

COPY init_container.sh /init_container.sh

ENTRYPOINT ["/init_container.sh"]