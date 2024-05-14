FROM ruby:3.1.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:2.3.6
RUN bundle install
RUN bundle exec rails db:create
RUN bundle exec rails db:migrate

COPY . .

RUN apt-get update && apt-get install -y nodejs

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
