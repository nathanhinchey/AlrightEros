# Schema Information

*Note: I may rework the gender/orientation system*

## users
column name         | data type | details
--------------------|-----------|-----------------------
id                  | integer   | not null, primary key
email               | string    | not null, unique
password_digest     | string    | not null

## sessions
column name         | data type | details
--------------------|-----------|-----------------------
id                  | integer   | not null, primary key
session_token       | string    | not null, unique
user_id             | string    | not null, foreign key

## profiles
column name         | data type | details
--------------------|-----------|-----------------------
id                  | integer   | not null, primary key
user_id             | integer   | not null, foreign key
username            | string    | not null, unique
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

## user_genders
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
profile_id      | integer   | not null, foreign key
gender_id       | integer   | not null, foreign key

## user_gender_preferences
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
profile_id      | integer   | not null, foreign key
liked_gender_id | integer   | not null, foreign key (references genders)

## orientations
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
name            | string    | not null, unique

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
