FROM dockerimages/ubuntu-core:14.04
ADD ./tools /
CMD ["/installer"]
