# Schema Information

## users
column name         | data type | details
--------------------|-----------|-----------------------
id                  | integer   | not null, primary key
email               | string    | not null, unique
username            | string    | not null, unique
password_digest     | string    | not null
session_token       | string    | not null, unique
profile             | integer   | not null, foreign key

## profile
column name         | data type | details
--------------------|-----------|-----------------------
gender              | integer   | not null
orientation         | integer   | not null, foreign key
birthday            | date      | not null
self-summary        | text      |
relationship_status | integer   | foreign key

##relationship_statuses
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
name            | string    | not null, unique

## genders
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
name            | string    | not null, unique

## orientations
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
name            | string    | not null, unique

## orientation_liked_genders
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
orientation_id  | integer   | not null, foreign key
liked_gender_id | integer   | not null, foreign key (references gender)

## questions
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
question_body   | string    | not null
option_1        | string    | not null
option_2        | string    | not null
option_3        | string    |
option_4        | string    |

## photos
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
user_id         | integer   | not null, foreign key
caption         | string    |

## question_answers
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
user_id         | integer   | not null, foreign key
question_id     | integer   | not null, foreign key
user_choice     | integer   | not null
match_choices   | integer[] | not null  (not sure how best to handle this)
user_comment    | string    |

## likes
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
liker_id    | integer   | not null, foreign key (references users)
liked_id    | integer   | not null, foreign key (references users)
