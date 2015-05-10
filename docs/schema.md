# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
username        | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique
gender          | integer   | not null, foreign key
orientation     | integer   | not null, foreign key

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
answer_choice   | integer   | not null
answer_comment  | string    |

## likes
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
liker_id    | integer   | not null, foreign key (references users)
liked_id    | integer   | not null, foreign key (references users)
