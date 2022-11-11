FROM ruby:3.1.2
RUN apt-get update && apt-get install -y nodejs npm && npm i -g yarn 

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle
COPY . .

ENTRYPOINT ["bash", "/app/entrypoint.sh"]

CMD ["rails", "s", "-b", "0.0.0.0"]