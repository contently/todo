#!/bin/bash -

echo "Running Rubocop..."
bundle exec rubocop . --auto-correct
