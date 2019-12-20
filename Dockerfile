FROM ruby:2.6.3 
# Install node 10.x with npm and latest yarn
RUN apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update
RUN apt-get install nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq
RUN apt-get install -y yarn

# Install necessary libs
RUN apt-get install -y git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev default-mysql-client

# Install bundler version 2.0.2
RUN gem install bundler -v 2.0.2
RUN gem update --system

# Set up project folder
RUN mkdir /pj-voucher
WORKDIR /pj-voucher

# Set up ENV
ENV LANG C.UTF-8
ENV BUNDLER_VERSION 2.0.2

# Set up Gems
COPY Gemfile /pj-voucher/Gemfile
COPY Gemfile.lock /pj-voucher/Gemfile.lock
RUN bundle install
