FROM debian:10
ENV CONFIG_PATH=/config \
    CONFIG_FILE=settings.txt \
    DOCKER_USER=user
COPY /assets /assets
RUN apt update -y
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN pip3 install -U pip
RUN pip3 install domain-connect-dyndns
RUN chmod +x "/assets/entrypoint"
RUN adduser ${DOCKER_USER}
RUN mkdir -p ${CONFIG_PATH}
RUN chown ${DOCKER_USER} ${CONFIG_PATH}
USER ${DOCKER_USER}
ENTRYPOINT [ "/assets/entrypoint" ]
VOLUME ${CONFIG_PATH}
CMD ["update"]