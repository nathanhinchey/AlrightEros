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
  yours.profile_id = you.id
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
    theirs.profile_id = them.id
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
      yours.profile_id = you.id
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
      theirs.profile_id = them.id
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
    yours.profile_id = you.id
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
      theirs.profile_id = them.id
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
  yours.profile_id = you.id
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
    theirs.profile_id = them.id
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
    yours.profile_id = you.id
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
    theirs.profile_id = them.id
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
    yours.profile_id = you.profile_id
  LEFT OUTER JOIN
    profiles AS them
    JOIN
    user_answers AS theirs
    ON
    theirs.profile_id = them.profile_id
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
      yours.profile_id = you.profile_id
  WHERE
    you.id = 1


  SELECT
    them.username, theirs.answer_id
  FROM
    profiles AS them
    JOIN
    user_answers AS theirs
    ON
    theirs.profile_id = them.profile_id
  WHERE
    them.id = 2


  SELECT
    them.username, you.username, theirs.answer_id, yours.answer_id
  FROM
    profiles AS you
    JOIN
    user_answers AS yours
    ON
    yours.uprofile_id = you.id
  LEFT OUTER JOIN
    profiles AS them
    JOIN
    user_answers AS theirs
    ON
    theirs.profile_id = them.profile_id
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
      yours.profile_id = you.profile_id
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
      theirs.profile_id = them.profile_id
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
  your_user_answers.profile_id = ?


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
    your_user_answers.profile_id = 1) as your
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
  their_answers.profile_id = 2

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
      profile_id = 2
  ) AS matches
ON
  matches.answer_id = yours.answer_id
WHERE
  yours.profile_id = 1
GROUP BY
  theirs.profile_id


/*

select all asnwers that are the same as mine, and join with profiles

*/

SELECT
  them.username,
  COUNT(*)
FROM
  questions as your_questions
JOIN
  answers as your_answers
ON
  your_answers.question_id = your_questions.id
JOIN
  user_answers as your_user_answers
ON
  your_user_answers.answer_id = your_answers.id
JOIN
  profiles as you
ON
  you.id = your_user_answers.profile_id
JOIN
  questions as their_questions
ON
  their_questions.id = your_questions.id
LEFT OUTER JOIN
  answers as their_answers
ON
  their_answers.id = your_answers.id
JOIN
  user_answers as their_user_answers
ON
  their_user_answers.answer_id = their_answers.id
JOIN
  profiles as them
ON
  their_user_answers.profile_id = them.id
WHERE
  you.id = 1
GROUP BY
  them.username;


SELECT
  them.username,
  COUNT(*)
FROM
  questions as your_questions
JOIN
  answers as your_answers
ON
  your_answers.question_id = your_questions.id
JOIN
  user_answers as your_user_answers
ON
  your_user_answers.answer_id = your_answers.id
JOIN
  profiles as you
ON
  you.id = your_user_answers.profile_id
JOIN
  questions as their_questions
ON
  their_questions.id = your_questions.id
JOIN
  answers as their_answers
ON
  their_answers.question_id = their_questions.id
JOIN
  user_answers as their_user_answers
ON
  their_user_answers.answer_id = their_answers.id
JOIN
  profiles as them
ON
  their_user_answers.profile_id = them.id
WHERE
  you.id = 1
GROUP BY
  them.username;








SELECT
  common_questions.id AS profile_id,
  ((common_answers.count * 100) / common_questions.count) AS match_percentage
FROM
  (SELECT
    them.id AS id,
    COUNT(*) AS count
  FROM
    questions as your_questions
  JOIN
    answers as your_answers
  ON
    your_answers.question_id = your_questions.id
  JOIN
    user_answers as your_user_answers
  ON
    your_user_answers.answer_id = your_answers.id
  JOIN
    profiles as you
  ON
    you.id = your_user_answers.profile_id
  JOIN
    questions as their_questions
  ON
    their_questions.id = your_questions.id
  JOIN
    answers as their_answers
  ON
    their_answers.question_id = their_questions.id
  JOIN
    user_answers as their_user_answers
  ON
    their_user_answers.answer_id = their_answers.id
  JOIN
    profiles as them
  ON
    their_user_answers.profile_id = them.id
  WHERE
    you.id = 1
  GROUP BY
    them.id) as common_questions
JOIN
  (SELECT
    them.id AS id,
    COUNT(*) AS count
  FROM
    questions as your_questions
  JOIN
    answers as your_answers
  ON
    your_answers.question_id = your_questions.id
  JOIN
    user_answers as your_user_answers
  ON
    your_user_answers.answer_id = your_answers.id
  JOIN
    profiles as you
  ON
    you.id = your_user_answers.profile_id
  JOIN
    questions as their_questions
  ON
    their_questions.id = your_questions.id
  LEFT OUTER JOIN
    answers as their_answers
  ON
    their_answers.id = your_answers.id
  JOIN
    user_answers as their_user_answers
  ON
    their_user_answers.answer_id = their_answers.id
  JOIN
    profiles as them
  ON
    their_user_answers.profile_id = them.id
  WHERE
    you.id = 1
  GROUP BY
    them.id) common_answers
ON
  common_answers.id = common_questions.id;









  SELECT
    them.id AS id,
    COUNT(*) AS count
  FROM
    questions as your_questions
  JOIN
    answers as your_answers
  ON
    your_answers.question_id = your_questions.id
  JOIN
    user_answers as your_user_answers
  ON
    your_user_answers.answer_id = your_answers.id
  JOIN
    profiles as you
  ON
    you.id = your_user_answers.profile_id
  JOIN
    questions as their_questions
  ON
    their_questions.id = your_questions.id
  JOIN
    answers as their_answers
  ON
    their_answers.question_id = their_questions.id
  JOIN
    user_answers as their_user_answers
  ON
    their_user_answers.answer_id = their_answers.id
  JOIN
    profiles as them
  ON
    their_user_answers.profile_id = them.id
  WHERE
    you.id = 1
  GROUP BY
    them.id) as common_questions






    SELECT
      them.id AS id
      -- COUNT(*) AS count
    FROM
      profiles as them
    LEFT OUTER JOIN
      user_answers as their_user_answers
    ON
      their_user_answers.profile_id = them.id
    LEFT OUTER JOIN
      answers AS their_answers
    ON
      their_user_answers.answer_id = their_answers.id
    LEFT OUTER JOIN
      questions as their_questions
    ON
      their_answers.question_id = their_questions.id
    LEFT OUTER JOIN
      questions AS your_questions
    ON
      your_questions.id = their_questions.id
    LEFT OUTER JOIN
      answers AS your_answers
    ON
      your_answers.question_id = your_questions.id
    LEFT OUTER JOIN
      user_answers AS your_user_answers
    ON
      your_user_answers.answer_id = your_answers.id
    LEFT OUTER JOIN
      profiles AS you
    ON
      you.id = your_user_answers.profile_id
    WHERE
      you.id = 1
    GROUP BY
      them.id



  SELECT
    them.id AS id,
    COUNT(your_questions.id) AS common_questions,
    -- COUNT(common_answers.id) AS common_answers,
    COUNT(their_questions.id) AS their_questions
  FROM
    profiles as them
  LEFT OUTER JOIN
    user_answers as their_user_answers
  ON
    their_user_answers.profile_id = them.id
  LEFT OUTER JOIN
    answers AS their_answers
  ON
    their_user_answers.answer_id = their_answers.id
  LEFT OUTER JOIN
    questions as their_questions
  ON
    their_answers.question_id = their_questions.id
  LEFT OUTER JOIN
    questions AS your_questions
  ON
    your_questions.id = their_questions.id
  LEFT OUTER JOIN
    answers AS your_answers
  ON
    your_answers.question_id = your_questions.id
  LEFT OUTER JOIN
    user_answers AS your_user_answers
  ON
    your_user_answers.answer_id = your_answers.id
  LEFT OUTER JOIN
    profiles AS you
  ON
    you.id = your_user_answers.profile_id
  -- LEFT OUTER JOIN
  --   answers AS common_answers
  -- ON
  --   your_answers.id = their_answers.id
  WHERE
     you.id = 1
  GROUP BY
    them.id


--GETS COUNT OF EVERYONE'S QUESTIONS
  SELECT
    them.id AS their_id,
    COUNT(their_questions.id) AS their_questions
  FROM
    profiles as them
  LEFT OUTER JOIN
    user_answers as their_user_answers
  ON
    their_user_answers.profile_id = them.id
  LEFT OUTER JOIN
    answers AS their_answers
  ON
    their_user_answers.answer_id = their_answers.id
  LEFT OUTER JOIN
    questions as their_questions
  ON
    their_answers.question_id = their_questions.id
  GROUP BY
    them.id


--GETS ALL YOUR QUESIONS
  SELECT
    your_questions.id
  FROM
    questions AS your_questions
  LEFT OUTER JOIN
    answers AS your_answers
  ON
    your_answers.question_id = your_questions.id
  LEFT OUTER JOIN
    user_answers AS your_user_answers
  ON
    your_user_answers.answer_id = your_answers.id
  LEFT OUTER JOIN
    profiles AS you
  ON
    you.id = your_user_answers.profile_id
  -- LEFT OUTER JOIN
  --   answers AS common_answers
  -- ON
  --   your_answers.id = their_answers.id
  WHERE
     you.id = 1


 --GETS EVERYONE'S QUESTIONS
   SELECT
     them.id AS their_id,
     their_questions.id AS question_id
   FROM
     profiles as them
   LEFT OUTER JOIN
     user_answers as their_user_answers
   ON
     their_user_answers.profile_id = them.id
   LEFT OUTER JOIN
     answers AS their_answers
   ON
     their_user_answers.answer_id = their_answers.id
   LEFT OUTER JOIN
     questions as their_questions
   ON
     their_answers.question_id = their_questions.id
   ORDER BY
     them.id





--  GETS ALL COMMON QUESTIONS!!!!!!!!!!! :D
    SELECT
      their_questions.their_id,
      COUNT(your_questions.id) AS common_questions
    FROM
     --GETS ALL YOUR QUESTIONS
       (SELECT
         your_questions.id AS id
       FROM
         questions AS your_questions
       LEFT OUTER JOIN
         answers AS your_answers
       ON
         your_answers.question_id = your_questions.id
       LEFT OUTER JOIN
         user_answers AS your_user_answers
       ON
         your_user_answers.answer_id = your_answers.id
       LEFT OUTER JOIN
         profiles AS you
       ON
         you.id = your_user_answers.profile_id
       WHERE
          you.id = 1) as your_questions
    FULL OUTER JOIN

      --GETS EVERYONE'S QUESTIONS
        (SELECT
          them.id AS their_id,
          their_questions.id AS id
        FROM
          profiles as them
        LEFT OUTER JOIN
          user_answers as their_user_answers
        ON
          their_user_answers.profile_id = them.id
        LEFT OUTER JOIN
          answers AS their_answers
        ON
          their_user_answers.answer_id = their_answers.id
        LEFT OUTER JOIN
          questions as their_questions
        ON
          their_answers.question_id = their_questions.id) AS their_questions
    ON
      your_questions.id = their_questions.id
    GROUP BY
      their_questions.their_id






      --GETS ALL COMMON ANSWERS
      ------------------------------
      SELECT
        theirs.their_id,
        COUNT(yours.answer_id) AS common_answers
      FROM
       --GETS ALL YOUR QUESIONS
         (SELECT
           your_questions.id AS question_id,
           your_answers.id AS answer_id
         FROM
           questions AS your_questions
         LEFT OUTER JOIN
           answers AS your_answers
         ON
           your_answers.question_id = your_questions.id
         LEFT OUTER JOIN
           user_answers AS your_user_answers
         ON
           your_user_answers.answer_id = your_answers.id
         LEFT OUTER JOIN
           profiles AS you
         ON
           you.id = your_user_answers.profile_id
         WHERE
            you.id = 1) as yours
      FULL OUTER JOIN

        --GETS EVERYONE'S QUESTIONS
          (SELECT
            them.id AS their_id,
            their_questions.id AS question_id,
            their_answers.id AS answer_id
          FROM
            profiles as them
          LEFT OUTER JOIN
            user_answers as their_user_answers
          ON
            their_user_answers.profile_id = them.id
          LEFT OUTER JOIN
            answers AS their_answers
          ON
            their_user_answers.answer_id = their_answers.id
          LEFT OUTER JOIN
            questions as their_questions
          ON
            their_answers.question_id = their_questions.id) AS theirs
      ON
        yours.answer_id = theirs.answer_id
      GROUP BY
        theirs.their_id
















































































--  GETS ALL QUESTIONS AND ANSWERS
SELECT
  theirs.their_id,
  COUNT(yours.question_id) AS common_questions,
  COUNT(your_answers.answer_id) AS common_answers
FROM
 --GETS ALL YOUR QUESTIONS
   (SELECT
     your_questions.id AS question_id,
     your_answers.id AS answer_id
   FROM
     questions AS your_questions
   LEFT OUTER JOIN
     answers AS your_answers
   ON
     your_answers.question_id = your_questions.id
   LEFT OUTER JOIN
     user_answers AS your_user_answers
   ON
     your_user_answers.answer_id = your_answers.id
   LEFT OUTER JOIN
     profiles AS you
   ON
     you.id = your_user_answers.profile_id
   WHERE
      you.id = 1) AS yours
FULL OUTER JOIN

  --GETS EVERYONE'S QUESTIONS
    (SELECT
      them.id AS their_id,
      their_questions.id AS question_id,
      their_answers.id AS answer_id
    FROM
      profiles as them
    LEFT OUTER JOIN
      user_answers as their_user_answers
    ON
      their_user_answers.profile_id = them.id
    LEFT OUTER JOIN
      answers AS their_answers
    ON
      their_user_answers.answer_id = their_answers.id
    LEFT OUTER JOIN
      questions as their_questions
    ON
      their_answers.question_id = their_questions.id) AS theirs
ON
  theirs.question_id = yours.question_id
FULL OUTER JOIN
  --GET YOUR ANSWERS
  (SELECT
    your_questions.id AS question_id,
    your_answers.id AS answer_id
  FROM
    questions AS your_questions
  LEFT OUTER JOIN
    answers AS your_answers
  ON
    your_answers.question_id = your_questions.id
  LEFT OUTER JOIN
    user_answers AS your_user_answers
  ON
    your_user_answers.answer_id = your_answers.id
  LEFT OUTER JOIN
    profiles AS you
  ON
    you.id = your_user_answers.profile_id
  WHERE
     you.id = 1) AS your_answers
ON
  your_answers.answer_id = theirs.answer_id

GROUP BY
  theirs.their_id

























  --  GETS ALL MATCH PERCENTAGES
  SELECT
    theirs.their_id as id,


    CASE count(yours.question_id)
      WHEN 0 THEN 0
      ELSE ((COUNT(your_answers.answer_id) * 100) / COUNT(yours.question_id))
    END AS match_percentage

    -- ((COUNT(your_answers.answer_id) * 100) / COUNT(yours.question_id))
    -- AS match_percentage
  FROM
   --GETS ALL YOUR QUESTIONS
     (SELECT
       your_questions.id AS question_id,
       your_answers.id AS answer_id
     FROM
       questions AS your_questions
     LEFT OUTER JOIN
       answers AS your_answers
     ON
       your_answers.question_id = your_questions.id
     LEFT OUTER JOIN
       user_answers AS your_user_answers
     ON
       your_user_answers.answer_id = your_answers.id
     LEFT OUTER JOIN
       profiles AS you
     ON
       you.id = your_user_answers.profile_id
     WHERE
        you.id = ?) AS yours
  FULL OUTER JOIN

    --GETS EVERYONE'S QUESTIONS
      (SELECT
        them.id AS their_id,
        their_questions.id AS question_id,
        their_answers.id AS answer_id
      FROM
        profiles as them
      LEFT OUTER JOIN
        user_answers as their_user_answers
      ON
        their_user_answers.profile_id = them.id
      LEFT OUTER JOIN
        answers AS their_answers
      ON
        their_user_answers.answer_id = their_answers.id
      LEFT OUTER JOIN
        questions as their_questions
      ON
        their_answers.question_id = their_questions.id) AS theirs
  ON
    theirs.question_id = yours.question_id
  FULL OUTER JOIN
    --GET YOUR ANSWERS
    (SELECT
      your_questions.id AS question_id,
      your_answers.id AS answer_id
    FROM
      questions AS your_questions
    LEFT OUTER JOIN
      answers AS your_answers
    ON
      your_answers.question_id = your_questions.id
    LEFT OUTER JOIN
      user_answers AS your_user_answers
    ON
      your_user_answers.answer_id = your_answers.id
    LEFT OUTER JOIN
      profiles AS you
    ON
      you.id = your_user_answers.profile_id
    WHERE
       you.id = ?) AS your_answers
  ON
    your_answers.answer_id = theirs.answer_id

  GROUP BY
    theirs.their_id
  ORDER BY
    match_percentage DESC;









-- extra space
