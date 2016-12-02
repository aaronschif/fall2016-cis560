from wowdb.sql import cursor, get_sql
#from wowdb.scripts.gen_data import location_file, vendor_file


def run_sql():
    with cursor() as cur:
        cur.execute(get_sql('create_tables.sql'))
        cur.execute(get_sql('functions.sql'))
        cur.execute(get_sql('populate_tables.sql'))
        #cur.copy_from(location_file.open(), 'location', ',')
        #cur.copy_from(vendor_file.open(), 'vendor', ',')


if __name__ == '__main__':
    run_sql()
