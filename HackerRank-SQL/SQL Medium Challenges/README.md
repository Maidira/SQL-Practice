# HackerRank-SQL

# SQL Medium Challenges

Q1. i) Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S). 

 ii) Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format: 
          There are a total of [occupation_count] [occupation]s.
    where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

   <img width="239" alt="q1" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/5d9b6db8-8489-4e3c-a40a-c97ed85af1e9">

    SELECT CONCAT(Name, '(', LEFT(Occupation, 1) , ')')
    FROM Occupations
    ORDER BY Name;
    
    SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.')
    FROM Occupations
    GROUP BY Occupation
    ORDER BY COUNT(Occupation) ASC, Occupation;

-----

Q2. Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

   <img width="239" alt="q1" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/5d9b6db8-8489-4e3c-a40a-c97ed85af1e9">

    SELECT 
        MIN(IF(occupation='Doctor',name,null)) AS Doctor,
        MIN(IF(occupation='Professor',name,null)) AS Professor, 
        MIN(IF(occupation='Singer',name,null)) AS Singer,
        MIN(IF(occupation='Actor',name,null)) AS Actor 
    FROM
        (SELECT *,row_number() OVER (partition by occupation ORDER BY name ) 
        AS ind FROM occupations) AS occups GROUP BY ind;

-----
