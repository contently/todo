#!/bin/bash

append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"

  if [ -w "$HOME/.zshrc.local" ]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\n" "$text" >> "$zshrc"
    else
      printf "\n%s\n" "$text" >> "$zshrc"
    fi
  fi
}

brew update

# Install basic tooling
brew install readline

# Setup langauge support
brew install asdf caskroom/cask/gpg-suite
append_to_zshrc '. /usr/local/opt/asdf/asdf.sh'
append_to_zshrc '. /usr/local/etc/bash_completion.d/asdf.bash'

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
/usr/local/opt/asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install

gem install bundler
bundle install

brew install qt@5.5
brew link --force qt@5.5
append_to_zshrc 'export PATH="$(brew --prefix qt@5.5)/bin:$PATH"'


# Intial services setup
./bin/spring stop

./bin/rake db:create:all
./bin/rake db:setup
RAILS_ENV=test ./bin/rake db:setup
