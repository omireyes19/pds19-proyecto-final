#! /usr/bin/env python
# -*- coding: utf-8 -*-

import psycopg2
import psycopg2.extras

import sys
from datetime import timedelta

import click

import io

from dynaconf import settings

from pathlib import Path

# Importamos la función 'config' del config.py file
from config import config
#obtenemos parámetros de configuracion
params = config()

@click.group()
@click.pass_context
def imdb(ctx):
    ctx.ensure_object(dict)
    conn = psycopg2.connect(**params)#settings.get('PGCONNSTRING'))
    conn.autocommit = True
    ctx.obj['conn'] = conn

    queries = {}
    for sql_file in Path('sql').glob('*.sql'):
        with open(sql_file,'r') as sql:
            sql_key = sql_file.stem
            query = str(sql.read())
            queries[sql_key] = query
    ctx.obj['queries'] = queries

@imdb.command()
@click.pass_context
def create_schemas(ctx):
    query = ctx.obj['queries'].get('create_schemas')
    conn =  ctx.obj['conn']
    with conn.cursor() as cur:
         cur.execute(query)
         print(query)


@imdb.command()
@click.pass_context
def create_raw_tables(ctx):
    query = ctx.obj['queries'].get('create_raw_tables')
    conn = ctx.obj['conn']
    with conn.cursor() as cur:
         cur.execute(query)
       	 print(query)

@imdb.command()
@click.pass_context
def check_tables(ctx):
    query = 'SELECT * FROM raw.title_ratings limit 5'
    conn =  ctx.obj['conn']
    with conn.cursor() as cur:
         cur.execute(query)
         print(cur.fetchall())
         t = 'hola.culeros.vayanse.alv'
         print(t.replace(".", "_"))

@imdb.command()
@click.pass_context
def load_imdb(ctx):
    conn = ctx.obj['conn']
    with conn.cursor() as cursor:
        for data_file in Path(settings.get('IMDBDIR')).glob('*.tsv'):
            print(data_file)
            table = data_file.stem
            table2 = table.replace(".", "_")
            print(table2)
            sql_statement = f"copy raw.{table2} from stdin "
            print(sql_statement)
            buffer = io.StringIO()
            with open(data_file,'r') as data:
                buffer.write(data.read())
            buffer.seek(0)
            cursor.copy_expert(sql_statement, file=buffer)

@imdb.command()
@click.pass_context
def to_clean(ctx):
    query = ctx.obj['queries'].get('to_clean')
    conn = ctx.obj['conn']
    with conn.cursor() as cur:
         cur.execute(query)
       	 print(query)

@imdb.command()
@click.pass_context
def to_semantic():
    query = ctx.obj['queries'].get('to_semantic')
    print(query)

@imdb.command()
@click.pass_context
def create_features():
    query = ctx.obj['queries'].get('create_features')
    print(query)


if __name__ == '__main__':
    imdb()
