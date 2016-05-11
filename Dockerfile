FROM ubuntu:latest 
MAINTAINER Anton Belov a.belov@kt-team.de

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && apt-get clean && \
	apt-get -y install \
	ssh python python-dev python-pip python-virtualenv &&\
        apt-get clean && \
	rm -rf /var/lib/apt/lists/*
ADD entry.sh /entry.sh
ADD ssh.sh /ssh.sh
ADD id_rsa /id_rsa
ADD authorized_keys /root/.ssh/authorized_keys
VOLUME ["/project"]

WORKDIR /var/www


EXPOSE 22

#ENTRYPOINT ["/entry.sh"]
CMD ["/ssh.sh"]
