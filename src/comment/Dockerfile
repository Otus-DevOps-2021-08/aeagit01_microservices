FROM ruby:2.2

ENV COMMENT_DATABASE_HOST msg_data
ENV COMMENT_DATABASE comments

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apt-get update -qq && apt-get install -y build-essential

COPY Gemfile* $APP_HOME/
RUN bundle install
COPY . $APP_HOME

CMD ["puma"]
