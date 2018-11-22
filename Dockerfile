FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /tax_calculator
WORKDIR /tax_calculator

ADD Gemfile /tax_calculator/Gemfile
ADD Gemfile.lock /tax_calculator/Gemfile.lock

RUN bundle install 

ADD . /tax_calculator

