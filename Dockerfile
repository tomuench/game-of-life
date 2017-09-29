FROM ruby:2.4

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

# Set Rails to run in production
ENV RAILS_ENV production 
ENV RACK_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV SECRET_KEY_BASE 78321c30756cfdd2d10420863234e024657445269dfa970a61658f1d68d4330fb81754c4bb7208e589febcafc73781e02471a6d4e9b61433f84996737e3a994c
RUN bundle exec rake assets:precompile RAILS_ENV=production
RUN bundle exec rake db:setup
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
