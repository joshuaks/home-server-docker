FROM centos:centos7.9.2009
#docker pull centos:centos7.9.2009

# https://www.wireguard.com/compilation/

COPY ./lib/modules /lib/modules

# STEP 1
RUN \
  yum update -y \
  && \
  yum install -y \
    elfutils-libelf-devel \
    kernel-devel \
    pkgconfig \
    "@Development Tools" \
    git

## STEP 2
#RUN \
#  git clone https://git.zx2c4.com/wireguard-linux-compat && \
#  git clone https://git.zx2c4.com/wireguard-tools

## STEP 3
#RUN \
#  make -C wireguard-linux-compat/src -j$(nproc) && \
#  make -C wireguard-linux-compat/src install


## STEP 4
#RUN \
#  make -C wireguard-tools/src -j$(nproc) \
#  make -C wireguard-tools/src install
