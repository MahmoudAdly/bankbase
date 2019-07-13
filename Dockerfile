# TODO: try using ruby:2.6-alpine and update the apt-get commands
FROM ruby:2.6

LABEL maintainer="Mahmoud Adly <mahmoud@thaghry.com>"

ENV APP_HOME=/usr/src/app

# @note
#   `gcc`, `make` and `libc-dev` are required for `byebug`
#   `tzdata` is required for `tzinfo`
RUN apt-get update -qq \
    && apt-get install -y --fix-missing \
      build-essential \
      file \
      libpq-dev \
      postgresql-client \
      ruby-dev \
    && apt-get clean

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Make the directory for the app
RUN mkdir -p $APP_HOME

# Set the working directory of everything to the directory we just made.
WORKDIR $APP_HOME

# Copy the gemfile and gemfile.lock so we can run bundle on it
COPY Gemfile* $APP_HOME/

# Install and run bundle to get the app ready
RUN gem install bundler
RUN bundle install

# Copy the Rails application into place
COPY . $APP_HOME

# Expose port 3000 on the container
EXPOSE 3000

# Run the application on port 3000
# CMD rails s -b 0.0.0.0 -p 3000
