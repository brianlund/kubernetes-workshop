FROM nginx:alpine

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    && pip install awscli --upgrade --user \
    && apk --purge -v del py-pip \
&& rm -rf /var/cache/apk/*

ADD cmd.sh /
RUN chmod a+x /cmd.sh

# Download content to be served from specified source, you'll need to change this
CMD ["/cmd.sh"]
