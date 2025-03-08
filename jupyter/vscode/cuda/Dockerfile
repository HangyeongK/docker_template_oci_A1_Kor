FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04
USER root

# ARGS
ARG YOUR_UID
ARG YOUR_GID
ARG CONTAINER_USER_NAME
ARG CONTAINER_USER_PASSWORD

# ADD FILES
ADD start.sh /
RUN chmod +rx /start.sh
CMD ["/start.sh"]

# BASH
SHELL ["/bin/bash", "-c"]

# UPDATE & INSTALL
RUN apt update
RUN apt-get update
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
RUN apt-get -y install tzdata sudo python3-pip git

# INSTALL OPENSSH
RUN apt-get -y install openssh-server
RUN mkdir /var/run/sshd

# USERADD
RUN groupadd -g ${YOUR_GID} ${CONTAINER_USER_NAME}
RUN useradd -m -s /bin/bash -N -u ${YOUR_UID} -g ${YOUR_GID} ${CONTAINER_USER_NAME}
RUN gpasswd -a ${CONTAINER_USER_NAME} sudo

# CHANGE PASSWORD
RUN echo "root:password" | chpasswd
RUN echo "${CONTAINER_USER_NAME}:${CONTAINER_USER_PASSWORD}" | chpasswd -e

# CHANGE USER
USER ${YOUR_UID}

# CHANGE WORK DIR
WORKDIR /home/${CONTAINER_USER_NAME}

# ADD BASHRC
RUN echo 'export PATH=$HOME/.local/bin:$PATH' >> $HOME/.bashrc
RUN echo "export LANG=ja_JP.UTF-8" >> $HOME/.bashrc

# INSTALL JUPYTER & LIBRARIES
COPY requirements.txt /home/${CONTAINER_USER_NAME}
RUN pip3 install -r requirements.txt
RUN rm -f /home/${CONTAINER_USER_NAME}/requirements.txt

EXPOSE 22