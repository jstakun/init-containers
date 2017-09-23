FROM rhel7.4
RUN mkdir /work
RUN mkdir /src
RUN mkdir /dest

COPY ./work/ /work/
COPY ./src /src/

ENV PREFIX OCP_
ENV OCP_TEST test
ENV OCP_MASTER_1 master_1
ENV OCP_MASTER_2 master_2

ENTRYPOINT ["/work/run.sh"]
