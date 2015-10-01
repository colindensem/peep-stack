FROM colindensem/elixir

# Curl required to install nodejs
# Nodejs required to run brunch tasks
# inotify-tools for livereload

RUN apt-get update \
    && apt-get install -y curl inotify-tools postgresql-client \
    && curl -sL https://deb.nodesource.com/setup_0.12 | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mix local.hex --force \
    && mix hex.info \
    && mix local.rebar --force \
    && mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.0.2/phoenix_new-1.0.2.ez

RUN mkdir /app
ADD . /app
WORKDIR /app


CMD ["/app/start.sh"]
