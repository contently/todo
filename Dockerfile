FROM ruby:2.7.1

RUN apt-get update
RUN apt-get -q -y install nodejs

# GEM update
RUN gem install bundler

# RAILS
RUN gem install rails -v 6.0.3.1

RUN mkdir /mnt/todo
WORKDIR /mnt/todo

COPY Gemfile* ./

# RUN bundle update
RUN bundle install