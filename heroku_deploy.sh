#!/bin/sh -e
APP_NAME=$1

git remote add heroku git@heroku.com:$APP_NAME.git
git fetch heroku
MIGRATION_CHANGES=$(git diff HEAD heroku/master --name-only -- db | wc -l)
echo "$MIGRATION_CHANGES db changes."

PREV_WORKERS=$(heroku ps --app $APP_NAME | grep "^worker." | wc -l | tr -d ' ')

# migrations require downtime so enter maintenance mode
if test $MIGRATION_CHANGES -gt 0; then
  heroku maintenance:on --app $APP_NAME

  # Make sure workers are not running during a migration
  heroku scale worker=0 --app $APP_NAME
fi

# deploy code changes (and implicitly restart the app and any running workers)
git push heroku $CIRCLE_SHA1:refs/heads/master

# run database migrations if needed and restart background workers once finished
if test $MIGRATION_CHANGES -gt 0; then
  heroku run rake db:migrate db:seed --app $APP_NAME
  heroku scale worker=$PREV_WORKERS --app $APP_NAME
  heroku restart --app $APP_NAME
fi

heroku maintenance:off --app $APP_NAME
