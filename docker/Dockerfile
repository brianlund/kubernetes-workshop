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

# Add content to be served from nginx
CMD ["/cmd.sh"]
