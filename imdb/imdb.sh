#!/bin/bash
sudo -i -u postgres psql -c "create role imdb login ;"
sudo -i -u postgres psql -c "alter role imdb with encrypted password 'some_password';"
sudo -i -u postgres psql -c "create database imdb;"
sudo -i -u postgres psql -c "grant all privileges on database imdb to imdb;"
