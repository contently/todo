FROM ruby:2.7.1

ARG RAILS_ENV
ENV RAILS_ENV=$RAILS_ENV

RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends gnupg2 curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app/src
WORKDIR $APP_HOME

ADD ./ $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle
RUN bundle install

EXPOSE 3000

WORKDIR /app/src/
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
