# syntax = docker/dockerfile:1

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t my-app .
# docker run -d -p 80:80 -p 443:443 --name my-app -e RAILS_MASTER_KEY=<value from config/master.key> my-app

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.2.5
FROM quay.io/evl.ms/fullstaq-ruby:$RUBY_VERSION-jemalloc-bullseye-slim AS base

# Set the working directory to /foodpack
WORKDIR /foodpack

# Install base packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libvips postgresql-client libyaml-dev build-essential && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Create the foodpack user and group in the base stage
RUN groupadd --system --gid 1000 foodpack && \
    useradd foodpack --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    mkdir -p /usr/local/bundle /foodpack && \
    chown -R foodpack:foodpack /usr/local/bundle /foodpack

# Throw-away build stage to reduce size of final image
FROM base AS build

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

USER foodpack:foodpack

# Install application gems
COPY --chown=foodpack:foodpack Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Copy application code
COPY --chown=foodpack:foodpack . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Final stage for app image
FROM base

# Copy built artifacts: gems, application
COPY --from=build --chown=foodpack:foodpack "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build --chown=foodpack:foodpack /foodpack /foodpack

# Ensure the foodpack user has permissions to the bundle directory
RUN chown -R foodpack:foodpack /usr/local/bundle

# Switch to non-root user for running the application
USER foodpack:foodpack

# Entrypoint prepares the database.
ENTRYPOINT ["/foodpack/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
