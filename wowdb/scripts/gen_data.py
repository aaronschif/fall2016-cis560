import csv
from pathlib import Path
from random import choice

from faker import Faker
fake = Faker()

LOCATION_NAMESPACE = (1000, 2000)
POSSIBLE_LOCATIONS = (
    "Highmountain",
    "Stormheim",
    "Azsuna",
    "Val'Sharah",
    "Suramar",
    "Dalaran",
    "The Broken Shore",
)

location_file = Path(__file__).parent.parent/'sql'/'location.csv'
vendor_file = Path(__file__).parent.parent/'sql'/'vendor.csv'


def main():
    with location_file.open('w') as location_fd, vendor_file.open('w') as vendor_fd:
        location_writer = csv.writer(location_fd)
        vendor_writer = csv.writer(vendor_fd)
        for i in range(*LOCATION_NAMESPACE):
            location_writer.writerow([i, 'Vendor', choice(POSSIBLE_LOCATIONS)])
            vendor_writer.writerow([i, fake.first_name(), fake.last_name()])


if __name__ == '__main__':
    main()
