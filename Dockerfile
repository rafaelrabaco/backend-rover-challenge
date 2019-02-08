FROM ruby:2.6-alpine

WORKDIR /usr/src/rover

COPY . .
COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["rake"]