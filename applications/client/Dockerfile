FROM iojs:2.0

RUN npm install -g bower ember-cli

RUN git clone https://github.com/facebook/watchman.git \
    && cd watchman \
    && git checkout v3.1 \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install

RUN mkdir /app
ADD . /app

WORKDIR /app

RUN npm install
RUN bower install --allow-root

CMD ["ember", "server"]
