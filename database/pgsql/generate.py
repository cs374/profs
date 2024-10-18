"""Generate fake data for the database."""

import csv
import faker
import psycopg
import random


def main():

    # Connect to the database
    con = psycopg.connect(host="localhost", user="profs", dbname="profs")
    cur = con.cursor()

    # Initialize generators
    random.seed(0)
    fake = faker.Faker()

    # Get the department codes
    with open("../data/Department.csv", newline="") as file:
        data = csv.reader(file)
        next(data)  # Skip the header row
        dept_codes = [row[0] for row in data]

    # Generate fake people
    for _ in range(100):
        person = (
            fake.email(),
            random.choice(["Faculty", "Student"]),
            fake.first_name(),
            fake.last_name(),
            fake.basic_phone_number(),
            random.choice(dept_codes),
        )
        cur.execute('INSERT INTO "Person" VALUES (%s, %s, %s, %s, %s, %s)', person)
    con.commit()

    # Pick three organizers
    cur.execute('SELECT "Email" FROM "Person" WHERE "Type" = \'Faculty\' ORDER BY random() LIMIT 3')
    for row in cur.fetchall():
        email = row[0]
        roles = fake.catch_phrase()
        cur.execute('INSERT INTO "Organizer" VALUES (2024, %s, %s)', (email, roles))
    con.commit()


if __name__ == "__main__":
    main()