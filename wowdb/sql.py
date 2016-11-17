from contextlib import contextmanager
import pkgutil

import psycopg2


def get_sql(filename):
    return pkgutil.get_data(__package__, 'sql/'+filename).decode('utf8')


def create_tables():
    with cursor() as cur:
        cur.execute(get_sql('create_tables.sql'))


@contextmanager
def cursor():
    with psycopg2.connect(host='138.197.18.7', user='wowdb') as conn:
        with conn.cursor() as cur:
            yield cur
