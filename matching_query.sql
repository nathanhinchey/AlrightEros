SELECT
  you.username, them.username, yours.answer_id, theirs.answer_id
FROM
  profiles as you
  JOIN
  user_answers as yours
  ON
  yours.user_id = you.id
  JOIN
  (
    SELECT
      your_answers.question_id as question_id, yours.answer_id as answer_id
    FROM
      answers as your_answers
    WHERE
      your_answers.id = yours.answer_id
  ) as your_questions
  ON
  your_questions.answer_id = yours.answer_id
  JOIN
  profiles as them
    JOIN
    user_answers as theirs
    ON
    theirs.user_id = them.user_id
    JOIN
    (
      SELECT
        their_answers.question_id as question_id, theirs.answer_id as answer_id
      FROM
        answers as their_answers
      WHERE
        their_answers.id = theirs.answer_id
    ) as their_questions
    ON
    their_questions.answer_id = theirs.answer_id
  ON
  their_questions.question_id = your_questions.question_id

WHERE
  you.id = 1 AND them.id = 2
