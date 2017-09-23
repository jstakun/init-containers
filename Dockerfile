FROM rhel7
RUN mkdir /work && mkdir /src && mkdir /dest

COPY ./work/ /work/
COPY ./src /src/

ENV PREFIX OCP_
ENV CONF https://github.com/jstakun/init-containers/raw/master/conf.tar.gz
ENV OCP_TEST test
ENV OCP_MASTER_1 master_1
ENV OCP_MASTER_2 master_2

ENTRYPOINT ["/work/run.sh"]
