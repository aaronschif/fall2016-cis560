from wowdb.sql import cursor, get_sql


def run_sql():
    with cursor() as cur:
        cur.execute(get_sql('create_tables.sql'))
        cur.execute(get_sql('populate_tables.sql'))

if __name__ == '__main__':
    run_sql()
