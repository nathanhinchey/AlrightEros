SELECT
  you.username, them.username, yours.answer_id, theirs.answer_id
FROM
    --Your questions & answers
    profiles as you
    JOIN
    user_answers as yours
    ON
    yours.user_id = you.id
    JOIN
    answers as your_answers
    ON
    yours.answer_id = your_answers.id
    JOIN
    questions as your_questions
    ON
    your_questions.id = your_answers.question_id
  LEFT JOIN
    --Their questions & answers
    profiles as them
    JOIN
    user_answers as theirs
    ON
    theirs.user_id = them.id
    JOIN
    answers as their_answers
    ON
    theirs.answer_id = their_answers.id
    JOIN
    questions as their_questions
    ON
    their_questions.id = their_answers.question_id
  ON
    their_answers.id = your_answers.id
WHERE
  you.id = 1
  AND them.id = 2


COUNT(you.*) --total questions in common

OUTER JOIN







--gets all the questions in common
SELECT
  yours.answer_id as your_answers, theirs.answer_id as their_answers
FROM
  --Your questions & answers
  profiles as you
  JOIN
  user_answers as yours
  ON
  yours.user_id = you.id
  JOIN
  answers as your_answers
  ON
  yours.answer_id = your_answers.id
  JOIN
  questions as your_questions
  ON
  your_questions.id = your_answers.question_id
  JOIN
    --Their questions & answers
    profiles as them
    JOIN
    user_answers as theirs
    ON
    theirs.user_id = them.id
    JOIN
    answers as their_answers
    ON
    theirs.answer_id = their_answers.id
    JOIN
    questions as their_questions
    ON
    their_questions.id = their_answers.question_id
  ON
    their_questions.id = your_questions.id
WHERE
  you.id = 1 AND them.id = 2
