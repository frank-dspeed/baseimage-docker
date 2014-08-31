FROM dockerimages/ubuntu-core:14.04
MAINTAINER Frank Lemanschik

ENV HOME /root
ENV LC_ALL=C
RNV DEBIAN_FRONTEND=noninteractive
RUN echo 'APT::Install-Recommends "0"; \n\
APT::Get::Assume-Yes "true"; \n\
APT::Get::force-yes "true"; \n\
APT::Install-Suggests "0";' > /etc/apt/apt.conf.d/01buildconfig
ADD . /build

RUN /build/system_services.sh \
 && /build/utilities.sh \
 && /build/cleanup.sh

CMD ["/sbin/my_init"]
