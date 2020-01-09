#! /bin/bash

# composer is already installed via Homebrew

# composer global require "squizlabs/php_codesniffer=*"
# phpcs --version

# git clone -b master https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git ~/.composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/WordPress
# phpcs --config-set installed_paths ~/.composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/WordPress
# phpcs -i

composer global require laravel/installer
composer global require laravel/lumen-installer
composer global require phpunit/phpunit:^7.5
composer global require spatie/phpunit-watcher:^1.8
composer global require brianium/paratest:^2
composer global require hirak/prestissimo
