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
    _id: string,
    email: string,
    type: string,
    first_name: string,
    last_name: string,
    phone: string,
    department: {
        code: string,
        name: string,
        auh_name: string,
        auh_email: string,
        college: {
            code: string,
            name: string,
            dean_name: string,
            dean_email: string,
        }
    },
    roles: [
        {
            year: {
                wkshopid: link,
                role: string,
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
    _id: string,
    state: string,
    title: string,
    advertisement: string,
    description: string,
    capacity: int,
    computer_needs: string,
    room_needs: string,
    max_repeat: int
    parent_questions: string,
    other_information: string,
    event_year: int,
    room_name: string,
    timeslots: [
        {
            start: time,
            end: time,
        },
    ]
    people: [
        {
            name: string,
            phone:string,
            role: string,
            id: link,
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
    name: string,
    type: string,
    capacity: int,
    features: [
        {
            name: string,
            description: string,
        },
    ]
}
```


## The Event Collection

Finally, each event stores the date and the conference organizers.
The year is stored separately (and redundant), given the year is used in so many instances in the application.

```
{
    _id: string,
    year: int,
    date: date,
    organizers: [
        {
            person: link,
            roles: string,
        },
    ]
}
```
