FROM ruby:2.7

RUN apt-get update -qq && apt-get install -y sudo nodejs postgresql-client

WORKDIR /original_product

COPY Gemfile /original_product/Gemfile
COPY Gemfile.lock /original_product/Gemfile.lock
RUN bundle install

COPY . /original_product

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]