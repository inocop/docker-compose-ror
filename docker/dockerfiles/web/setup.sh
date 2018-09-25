#!/usr/bin/env bash

set -eux


APP_DIR=/var/rails_app/current
cd ${APP_DIR}


###########################
#  create project         #
###########################
# gem install rails -v '5.1.6'
# rails _5.1.6_ new . --database=mysql --skip-bundle --skip-coffee --skip-turbolinks --skip-sprockets

###########################
#  change file            #
###########################
# edit config/database.yml
#        use myconf.yml
#
# edit config/secrets.yml
#        use myconf.yml
#
# edit config/application.rb
#        use myconf.yml
#
# edit config/environments/development.rb
#        config.file_watcher: ActiveSupport::EventedFileUpdateChecker -> ActiveSupport::FileUpdateChecker（Dockerの共有フォルダでファイル更新を検出するため）
#
# edit config/environments/production.rb
#        config.i18n.fallbacks: コメントアウト（application.rbで設定）

bundle config --local build.nokogiri --use-system-libraries
bundle install --path vendor/bundle

bundle exec rake db:create:all
bundle exec rake db:environment:set RAILS_ENV=$RAILS_ENV
bundle exec rake db:schema:load # or bundle exec rake db:migrate
bundle exec rake db:seed


cd ${APP_DIR}/public
npm install


# puma (rails defautl)
# $ cd /var/rails_app
# $ bundle exec rails s -b 0.0.0.0 -p 8888

# passenger
# $ passenger-config restart-app
