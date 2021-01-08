#! /bin/bash

composer global require laravel/installer
composer global require brianium/paratest
composer global require phpunit/phpunit
composer global require spatie/phpunit-watcher
composer global require --dev squizlabs/php_codesniffer
composer global require --dev dealerdirect/phpcodesniffer-composer-installer
composer global require --dev wptrt/wpthemereview
composer global require --dev automattic/vipwpcs

git clone -b master https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git ~/.composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/WordPress
phpcs --config-set installed_paths ~/.composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/WordPress
phpcs -i
