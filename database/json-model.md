# Document Database Model

Project Title: **madiSTEM Workshop Management**

Team Name: **profs**


## Relational Mapping

The following **4 collections** correspond to the **12 tables** found in [schema.png](schema.png).

* Person
    * person
    * department
    * college
    * person_workshop

* Workshop
    * workshop
    * workshop_timeslot
    * timeslot

* Room
    * room
    * room_feature
    * feature

* Event
    * event
    * organizer


## The Person Collection

The department and college data can be stored with the person; once entered, it hardly changes.
Departments and colleges do not necessarily need to be stored in the database in their own collection(s), because they're used only for lookup for Person data entry.
The role(s) a person have per event year is stored with the person, because this information will be needed to known what permissions a person has when they log in.
A link (dbms specific) is stored to the workshop, if the person is connected to a workshop.

```
{
    'id': 'elkadima',
    'email': 'elkadima@jmu.edu',
    'type': 'faculty',
    'first_name': 'Mona',
    'last_name': 'Rizvi',
    'phone': '15401111111',
    'department': {
        'code': 'CS',
        'name': 'Computer Science,
        'auh_name': 'Vetria Byrd',
        'auh_email': 'byrd@jmu.edu',
        'college': {
            'code': 'CISE',
            'name': 'College of Integrated Science and Engineering',
            'dean_name': 'Jeff Tang',
            'dean_email': 'tang@jmu.edu',
        }
    },
    roles: [
        {
            'year': 2024
            'role': {
                'role': 'organizer',
            },
        },
        {
            'year': 2024
            'role': {
                'workshop_id': 321    # DBMS-specific linking mechanism
                'role': 'lead',
            },
        },
        {
            'year': 2023
            'role': {
                'workshop_id': 299   # DBMS-specific linking mechanism
                'role': 'lead',
            },
        },
    ]
}
```


## The Workshop Collection

The room name can be stored directly in the workshop.
The list of rooms, including department and college information, hardly changes and may not even need to be stored---it's just used for lookup.
The list of people involved can just be minimal, but this duplication may be helpful.
A link to the full Person data is not required from this direction, but may be stored anyway.

```
{
    'id': 299,
    'state': 'accepted',
    'title': 'Create your own game!',
    'advertisement': 'Create your own game using Scratch...',
    'description': 'Students will use Scratch to develop a fish game...',
    'capacity': 15,
    'computer_needs': 'Each student needs a computer.',
    'room_needs': 'Computer lab is best, or laptops',
    'max_repeat': 3
    'parent_questions': 'Ask you child to show your their game on the Scratch site.',
    'other_information': 'N/A',
    'event_year': 2023,
    'room_name': 'ENGEO 2204',
    'timeslots': [
        {
            'start': '9:30',
            'end': '10:30',
        },
        {
            'start': '13:20',
            'end': '13:40',
        }
    ]
    people: [
        {
            'name': 'Mona Rizvi',
            'phone': '17571111111',
            'role': 'lead',
            'id': 'elkadima',    # DBMS-specific linking mechanism
        },
        {
            'name': 'Mariya Rizvi',
            'phone': '17572222222',
            'role': 'volunteer',
            'id': 'rizvi',       # DBMS-specific linking mechanism
        },
    ]
}
```


## The Room Collection

The room, department, and college data could be stored in their own collections to serve as lookup tables, but they hardly change and could be managed some other way.
The timeslot data for the day's schedule also may or may not be stored in a collection.
Room is shown as an example collection below.

```
{
    'name': 'ENGEO 2204',
    'type': 'computer lab',
    'capacity': 32,
    'features': [
        {
            'name': 'lab',
            'description': '32 Linux Mint desktops',
        },
        {
            'name': 'instructor computer',
            'description': '1 Linux Mint desktop',
        },
        {
            'name': 'projector',
            'description': 'connection from instructor computer or HDMI',
        },
    ]
}
```


## The Event Collection

Finally, each event stores the date and the conference organizers.
The year is stored separately (and redundant), given the year is used in so many instances in the application.

```
{
    'id': 5,
    'year': 2024,
    'date': '2024-03-23',
    'organizers': [
        {
            'person': 'lam2mo',       # DBMS-specific linking mechanism
            'roles': ['co-chairperson', 'volunteer team'],
        },
        {
            'person': 'elkadima',       # DBMS-specific linking mechanism
            'roles': ['workshop team'],
        },
    ]
}
```
