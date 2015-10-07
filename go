#!/usr/bin/env bash

REQUIRED_RUBY=2.0.0

(rbenv versions | grep $REQUIRED_RUBY) || rbenv install $REQUIRED_RUBY
rbenv local $REQUIRED_RUBY
(rbenv exec gem list | grep bundler) || rbenv exec gem install bundler
bundle --path vendor/bundle --quiet

IP_ADDRESS=`docker-machine ip default`
PORT=4440
DOCKER_IMAGE=jordan/rundeck

export SERVER_URL=http://$IP_ADDRESS:$PORT
export AUTH_TOKEN='xyppBQnXf898f2Nye55SAFOiKlOqMCoP'

docker pull $DOCKER_IMAGE

if [[ $(docker ps) != *$DOCKER_IMAGE* ]]; then
  docker run -p $PORT:$PORT -e SERVER_URL=http://$IP_ADDRESS:$PORT -t $DOCKER_IMAGE:latest;
fi

if [[ $# -eq 0 ]]; then
    bundle exec rake -T;
    exit 0
fi

bundle exec rake "$@"
