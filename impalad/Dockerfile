FROM mfisser/impala-base:1.0.0

ADD run.sh /run.sh
RUN chmod a+x /run.sh
#VOLUME /data/results
EXPOSE 21000 21050 25000

CMD ["/run.sh"]
