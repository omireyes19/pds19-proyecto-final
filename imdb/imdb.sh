#!/bin/bash
sudo su postgres
createuser imdb -D -l -P
createdb -O imdb imdb
psql -h 0.0.0.0 -u
imdb -d imdb -w

