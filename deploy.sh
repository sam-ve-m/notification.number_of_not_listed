fission spec init
fission env create --spec --name notification-count-miss-env --image nexus.sigame.com.br/fission-notification-count-miss:0.1.0-2 --poolsize 0 --version 3 --imagepullsecret "nexus-v3" --spec
fission fn create --spec --name notification-count-miss-fn --env notification-count-miss-env --code fission.py --targetcpu 80 --executortype newdeploy --maxscale 3 --requestsperpod 10000 --spec
fission route create --spec --name notification-count-miss-rt --method GET --url /notifications/count_unlisted --function notification-count-miss-fn
