FROM rhel7
RUN mkdir -p /work/bin && mkdir /src && mkdir /dest

COPY ./bin/ /work/bin/
COPY ./src /src/

ENV PREFIX=OCP_\
    CONF=https://raw.githubusercontent.com/jstakun/init-containers/master/conf.tar.gz\
    OCP_TEST=test OCP_MASTER_1=master_1 OCP_MASTER_2=master_2

ENTRYPOINT ["/work/bin/run.sh"]
