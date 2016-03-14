#!/bin/bash

sed -i 's|tcp(.*:3306)|tcp('"${DBHOST}"':3306)|g' server.go

fw_depends go

go get -u github.com/go-sql-driver/mysql
go get -u github.com/valyala/fasthttp
go get -u github.com/valyala/quicktemplate/...

rm -f ./server
go build -o server
./server -prefork &
