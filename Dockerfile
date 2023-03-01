FROM ruby:3.2.1
WORKDIR /var/app
COPY . .
RUN gem build logical.gemspec -o logical.gem

FROM ruby:3.2.1
WORKDIR /var/app
COPY --from=0 /var/app/logical.gem .
RUN gem install logical.gem && rm logical.gem
CMD irb -r logical