#!/usr/bin/env bash

# docker build --no-cache -t koddo/dropbox - < Dockerfile_dropbox

docker run -d \
       --name dropbox \
       --restart on-failure \
       -v /vagrant-dropbox:/home/theuser/Dropbox \
       koddo/dropbox



# docker logs --follow dropbox
# docker logs --tail 50 dropbox

