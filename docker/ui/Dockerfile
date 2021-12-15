FROM ruby:2.7-alpine

ENV APP_HOME /app
RUN mkdir $APP_HOME

ENV BUNDLER_VERSION 2.0.2

RUN apk add --update --no-cache  build-base && gem install bundler -v "$BUNDLER_VERSION"

WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
COPY . $APP_HOME

RUN bundle check || bundle install

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
