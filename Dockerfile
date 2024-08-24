ARG RUBY_VERSION=3.2.5
FROM quay.io/evl.ms/fullstaq-ruby:$RUBY_VERSION-jemalloc-bullseye-slim AS base

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim postgresql-client libjemalloc2 curl git libyaml-dev
ENV EDITOR vim

RUN mkdir /foodpack
WORKDIR /foodpack

RUN gem update --system

COPY Gemfile /foodpack/Gemfile
COPY Gemfile.lock /foodpack/Gemfile.lock
RUN bundle update --bundler
RUN bundle install

ENV RAILS_ENV=development

CMD bash
