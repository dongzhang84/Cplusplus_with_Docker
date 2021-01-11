FROM gcc:latest
FROM python:3.7

 COPY . /usr/src/Athena

 WORKDIR /usr/src/Athena
 
 RUN python configure.py --prob shock_tube -b
 RUN make clean
 RUN make all

 WORKDIR /usr/src/Athena/work
 ENTRYPOINT ["../bin/athena","-i","athinput.bw"]