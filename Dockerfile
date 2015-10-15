FROM centos:7

RUN yum group install -y "Development Tools" > /dev/null \
 && git clone git://github.com/wiredtiger/wiredtiger.git > /dev/null \
 && cd wiredtiger \
 && ./autogen.sh \
 && ./configure \
 && make

ENTRYPOINT ["/wiredtiger/bench/wtperf/wtperf"]
