FROM registry.it.kmitl.ac.th/nodejs

ADD react-webpack-node/ /opt/data/
COPY build-files/start.sh /

RUN apk update && apk add krb5 krb5-dev && \
    cd /opt/data && \
    npm install && \
    npm run build

WORKDIR "/opt/data"
CMD ["/start.sh"]
