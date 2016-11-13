from faker import Factory

from ..sql import cursor

fake = Factory.create()


def create_fake_data():
    with cursor() as cur:
        for _ in range(20):
            cur.execute(
                'insert into gear (id, name, tradable) values (%s, %s)',
                (fake.word(), fake.pybool()))


if __name__ == '__main__':
    create_fake_data()
