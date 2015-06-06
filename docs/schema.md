# Schema Information

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
birthday            | date      | not null
self_summary        | text      |
picture_url         | string

## questions (created)
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
question_body   | string    | not null, unique

## answers (created)
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
question_id     | integer   | not null, foreign key
answer_text     | string    | not null

## user_answers (created)
column name        | data type | details
-------------------|-----------|-----------------------
id                 | integer   | not null, primary key
profile_id         | integer   | not null, foreign key
answer_id          | integer   | not null, foreign key
user_comment       | string    |

##acceptable_answers
column name        | data type | details
-------------------|-----------|-----------------------
id                 | integer   | not null, primary key
user_answer_id     | integer   | not null, foreign key
answer_id          | integer   | not null, foreign key

## messages (created)
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
sender_id   | integer   | not null, foreign key (references users)
receiver_id | integer   | not null, foreign key (references users)
body				| text 			| not null
is_read			| boolean		| not null, default: false

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
