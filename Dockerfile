FROM python:3-alpine

ENV S3CMD_VERSION='2.1.0'

RUN python3 -m pip --no-cache-dir install s3cmd==${S3CMD_VERSION}

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "--help" ]
