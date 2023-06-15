FROM alpine

COPY VERSION /etc/sysver
RUN apk add --no-cache \
    sudo bash bash-completion less
RUN adduser -D -g linux -s /bin/bash linux && \
    echo 'linux:penguin' | chpasswd && \
    cp -r /etc/skel /home/linux; chown -R linux:linux /home/linux
RUN echo 'linux ALL = (ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/linux && \
    chmod 400 /etc/sudoers.d/linux
RUN touch /var/lib/sudo/lectured/linux && \
    chgrp linux /var/lib/sudo/lectured/linux
# 問題番号
ARG QNO=0000

COPY Q/system/run.sh /usr/local/bin/
COPY Q/${QNO} /etc/q
RUN chmod +x /usr/local/bin/run.sh /etc/q/*.sh
WORKDIR /home/linux
USER linux
CMD ["run.sh"]
