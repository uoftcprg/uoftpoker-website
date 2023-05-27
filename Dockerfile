FROM ruby:3.2 AS builder
WORKDIR /srv/jekyll
ARG JEKYLL_ENV=production
COPY . .
RUN bundle install && bundle exec jekyll build

FROM nginx:1.24
WORKDIR /usr/share/nginx/html
COPY --link --from=builder /srv/jekyll/_site .
