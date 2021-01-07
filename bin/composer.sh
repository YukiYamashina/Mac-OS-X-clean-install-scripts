#! /bin/bash

composer global require laravel/installer
composer global require brianium/paratest
composer global require phpunit/phpunit
composer global require spatie/phpunit-watcher
composer global require squizlabs/php_codesniffer
composer global require wptrt/wpthemereview
composer global require dealerdirect/phpcodesniffer-composer-installer

git clone -b master https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git ~/.composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/WordPress
phpcs --config-set installed_paths ~/.composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/WordPress
phpcs -i
