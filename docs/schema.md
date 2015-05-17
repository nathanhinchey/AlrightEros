# Schema Information

*Note: I may rework the gender/orientation system*

## users (created)
column name         | data type | details
--------------------|-----------|-----------------------
id                  | integer   | not null, primary key
email               | string    | not null, unique
password_digest     | string    | not null

## sessions (created)
column name         | data type | details
--------------------|-----------|-----------------------
id                  | integer   | not null, primary key
session_token       | string    | not null, unique
user_id             | string    | not null, foreign key

## profiles (created)
column name         | data type | details
--------------------|-----------|-----------------------
id                  | integer   | not null, primary key
user_id             | integer   | not null, foreign key
username            | string    | not null, unique
<!-- orientation         | integer   | not null, foreign key -->
birthday            | date      | not null
self_summary        | text      |
<!-- relationship_status | integer   | foreign key -->

## questions
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
question_body   | string    | not null, unique

## answers
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
question_id     | integer   | not null, foreign key
answer_text     | string    | not null

## user_answers
column name        | data type | details
-------------------|-----------|-----------------------
id                 | integer   | not null, primary key
user_id            | integer   | not null, foreign key
answer_id          | integer   | not null, foreign key
user_choice        | integer   | not null
acceptable_choices | integer[] | not null  (not sure how best to handle this)
user_comment       | string    |
importance         | integer   | not null

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

## profile_genders
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
profile_id      | integer   | not null, foreign key
gender_id       | integer   | not null, foreign key

## profile_gender_preferences
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

## photos
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
user_id         | integer   | not null, foreign key
caption         | string    |

## likes
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
liker_id    | integer   | not null, foreign key (references users)
liked_id    | integer   | not null, foreign key (references users)
