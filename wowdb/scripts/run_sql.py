from wowdb.sql import cursor, get_sql
from wowdb.scripts.gen_data import location_file, vendor_file


def run_sql():
    with cursor() as cur:
        cur.execute(get_sql('create_tables.sql'))
        cur.execute(get_sql('populate_tables.sql'))
        cur.execute("copy vendor from '{}' csv".format(location_file))
        cur.execute("copy vendor from '{}' csv".format(vendor_file))

if __name__ == '__main__':
    run_sql()
