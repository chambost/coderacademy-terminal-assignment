#!/usr/bin/env sh
echo "Installing Improv Cloze Drama app, including bundled gems"
git clone https://github.com/chambost/coderacademy-terminal-assignment.git
cd coderacademy-terminal-assignment/src
bundle install
echo "Installation complete. To run type ./run.sh or"
echo "ruby init.rb choose"
