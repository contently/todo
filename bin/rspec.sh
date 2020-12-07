#!/bin/bash -

echo "Running R-Spec..."

RAILS_ENV=test bundle exec rspec spec
