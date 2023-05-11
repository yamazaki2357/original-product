#!/bin/sh

# スクリプト実行中にエラーが発生した場合、即座にスクリプトを終了する
set -e


count=0
until mysqladmin ping -h"$DB_HOST" --silent || [ $count -eq 5 ]; do
  >&2 echo "MySQLは利用できません - 一時停止中"
  sleep 1
  count=$((count+1))
done

# もし既にサーバープロセスが実行中であれば、サーバーのPIDファイルを削除する
if [ -f /original_product/tmp/pids/server.pid ]; then
  rm /original_product/tmp/pids/server.pid
fi

bundle exec rails s -p 3000 -b '0.0.0.0'
