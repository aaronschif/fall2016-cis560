import psycopg2


def bootstrap_db():
    with psycopg2.connect(host="localhost", user="postgres") as conn:
        conn.autocommit = True
        with conn.cursor() as cur:
            cur.execute("CREATE ROLE wowdb LOGIN PASSWORD 'my_password';")
            cur.execute("CREATE DATABASE wowdb;")
            cur.execute("GRANT ALL PRIVILEGES ON DATABASE wowdb TO wowdb;")
