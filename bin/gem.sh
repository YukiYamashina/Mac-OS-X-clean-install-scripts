#! /bin/bash

rbenv install 2.5.3
rbenv rehash
rbenv global 2.5.3
rbenv versions

gem install nokogiri robotex mechanize fastimage sqlite3
