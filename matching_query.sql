--gets all the questions in common with a particular user
SELECT
  your_questions.id as question_id,
  yours.answer_id as your_answers,
  theirs.answer_id as their_answers
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
  you.id = ? AND them.id = ?





  SELECT
  yours.answer_id, theirs.answer_id
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
    you.id = ? AND them.id = ?








SELECT
  them.id, COUNT(shared_questions), COUNT(shared_answers)
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
  LEFT OUTER JOIN
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

SELECT
  you.username, them.username, yours.answer_id, theirs.answer_id
FROM
    profiles AS you
    JOIN
    user_answers AS yours
    ON
    yours.user_id = you.user_id
  LEFT OUTER JOIN
    profiles AS them
    JOIN
    user_answers AS theirs
    ON
    theirs.user_id = them.user_id
  ON
    theirs.answer_id = yours.answer_id
WHERE
  you.id = 1
  AND them.id = 2


  SELECT
    you.username, yours.answer_id
  FROM
      profiles AS you
      JOIN
      user_answers AS yours
      ON
      yours.user_id = you.user_id
  WHERE
    you.id = 1


  SELECT
    them.username, theirs.answer_id
  FROM
    profiles AS them
    JOIN
    user_answers AS theirs
    ON
    theirs.user_id = them.user_id
  WHERE
    them.id = 2


  SELECT
    them.username, you.username, theirs.answer_id, yours.answer_id
  FROM
    profiles AS you
    JOIN
    user_answers AS yours
    ON
    yours.user_id = you.user_id
  LEFT OUTER JOIN
    profiles AS them
    JOIN
    user_answers AS theirs
    ON
    theirs.user_id = them.user_id
  ON
    theirs.answer_id = yours.answer_id
  WHERE
    you.id = 2 AND them.id = 1


COUNT(you.*) --total questions in common

OUTER JOIN

SELECT
    *
  FROM
    (SELECT
      yours.answer_id, answers.question_id
    FROM
      profiles AS you
    JOIN
      user_answers AS yours
    ON
      yours.user_id = you.user_id
    JOIN
      answers
    ON
      answers.id = yours.answer_id
    WHERE
      you.id=1
    ) as you
  LEFT OUTER JOIN
    (SELECT
      theirs.answer_id, answers.question_id
    FROM
      profiles AS them
    JOIN
      user_answers AS theirs
    ON
      theirs.user_id = them.user_id
    JOIN
      answers
    ON
      answers.id = theirs.answer_id
    WHERE
      them.id=2) as them
  ON
    them.answer_id = you.answer_id
  WHERE
    you.question_id = them.question_id






-- STARTING FROM QUESTIONS

--gets your questions and answers
SELECT
  your_questions.id AS your_questions,
  your_answers.id AS your_answers
FROM
  questions AS your_questions
JOIN
  answers AS your_answers
ON
  your_answers.question_id = your_questions.id
JOIN
  user_answers as your_user_answers
ON
  your_user_answers.answer_id = your_answers.id
WHERE
  your_user_answers.user_id = ?


-- "they" in this section is semantically plural

SELECT
  them.id AS other_user,
  your.question_id AS question_id,
  their_answers.id AS their_answer
FROM
  (SELECT
    your_questions.id AS question_id,
    your_answers.id AS answer_id
  FROM
    questions AS your_questions
  JOIN
    answers AS your_answers
  ON
    your_answers.question_id = your_questions.id
  JOIN
    user_answers as your_user_answers
  ON
    your_user_answers.answer_id = your_answers.id
  WHERE
    your_user_answers.user_id = 1) as your
JOIN
  questions AS their_questions
  ON
  your.question_id = their_questions.id
  JOIN
  user_answers AS their_answers
  ON
  their_answers.answer_id = your.answer_id
  JOIN
  users AS them
  ON
  their_answers.user_id = user_id;

-- WRONG!!! It results in this table:
/*
other_user | common_questions | common_answers
------------+------------------+----------------
         11 |               14 |             14
         12 |               14 |             14
         10 |               14 |             14
          2 |               14 |             14
          5 |               14 |             14
          8 |               14 |             14
          6 |               14 |             14
          4 |               14 |             14
          1 |               14 |             14
          3 |               14 |             14
          9 |               14 |             14
          7 |               14 |             14
*/


SELECT
   COUNT(matches.answer_id) as numMatches, COUNT(*) as total
FROM
  user_answers as yours
JOIN
  answers
ON
  answers.id = yours.answer_id
JOIN
  (
  SELECT
    answers.question_id, them.answer_id
  FROM
    user_answers AS them
  JOIN
    answers
  ON
    answers.id = them.answer_id
  ) AS theirs
ON
  theirs.question_id = answers.question_id
LEFT OUTER JOIN
  (
    SELECT
      *
    FROM
      user_answers
    WHERE
      user_id = 2
  ) AS matches
ON
  matches.answer_id = yours.answer_id
WHERE
  yours.user_id = 1
GROUP BY
  theirs.user_id
