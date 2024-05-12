FROM ruby:3

RUN apt-get update && apt-get install -y \
    postgresql-client \
    libpq-dev \
    nodejs \
    yarn

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
