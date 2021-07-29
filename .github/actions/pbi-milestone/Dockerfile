FROM ruby:2-alpine

RUN gem install octokit

COPY lib /lib
ENTRYPOINT ["ruby", "/lib/main.rb"]
