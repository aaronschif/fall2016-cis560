from wowdb.sql import cursor, get_sql


def run_sql():
    with cursor() as cur:
        cur.execute(get_sql(input("Name of the sql file: ")))

if __name__ == '__main__':
    run_sql()
