#!/bin/bash
fission spec init
fission env create --spec --name notification-count-unlisted-env --image nexus.sigame.com.br/fission-async:0.1.9 --builder nexus.sigame.com.br/fission-builder-3.8:0.0.1
fission fn create --spec --name notification-count-unlisted-fn --env notification-count-unlisted-env --src "./func/*" --entrypoint main.get_number_of_unlisted_notifications --executortype newdeploy --maxscale 1
fission route create --spec --name notification-count-unlisted-rt --method GET --url /notifications/count_unlisted --function notification-count-unlisted-fn