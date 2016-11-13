import os
from contextlib import contextmanager
import pkgutil

import psycopg2

os.environ.setdefault('PGHOST', 'localhost')
os.environ.setdefault('PGUSER', 'wowdb')


def get_sql(filename):
    return pkgutil.get_data(__package__, 'sql/'+filename).decode('utf8')


def create_tables():
    with cursor() as cur:
        cur.execute(get_sql('create_tables.sql'))


@contextmanager
def cursor():
    with psycopg2.connect(host='localhost', user='wowdb') as conn:
        with conn.cursor() as cur:
            yield cur
