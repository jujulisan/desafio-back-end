FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /blur-pagment
WORKDIR /blur-pagment
COPY Gemfile /blur-pagment/Gemfile
COPY Gemfile.lock /blur-pagment/Gemfile.lock
RUN bundle install
COPY . /blur-pagment

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]