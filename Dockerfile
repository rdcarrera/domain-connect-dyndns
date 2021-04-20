FROM centos:8
ENV CONFIG_PATH=/config \
    CONFIG_FILE=settings.txt \
    DOCKER_USER=user
COPY /assets /assets
RUN yum -y update \
 && yum -y install python38 \
 && pip3 install -U pip \
 && pip3 install domain-connect-dyndns \
 && chmod +x "/assets/entrypoint" \
 && adduser ${DOCKER_USER} \
 && mkdir -p ${CONFIG_PATH} \
 && chown ${DOCKER_USER}${CONFIG_PATH}
USER ${DOCKER_USER}
ENTRYPOINT [ "/assets/entrypoint" ]
VOLUME ${CONFIG_PATH}
CMD ["update"]