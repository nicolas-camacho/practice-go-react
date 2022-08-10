#!/bin/sh

app_build_frontend() {
    (cd ./client && npm run build) || return 1
    return 0
}

app_build_backend() {
    go build || return 1
    return 0
}

app_build() {
    app_build_frontend || return 1
    app_build_backend || return 1
    echo "Starting app ..."
    ./practice-go-react || return 1
    return 0
}

app_build