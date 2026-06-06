# HackerRank-SQL

# SQL Easy Challenges

Q1. Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA. 

<img width="292" alt="easy1" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/084f7a1e-b6c8-494d-a666-ef9185e670df">

    SELECT *
    FROM city 
    WHERE 
        population > 100000 AND countrycode = 'USA';

-----
Q2. Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA. 

<img width="283" alt="q2" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/d169f375-ce24-4a7d-b178-13e71f2dd1be">

    SELECT name
    FROM city
    WHERE 
        population > 120000 AND countrycode = 'USA';

-----
Q3. Query all columns (attributes) for every row in the CITY table.

<img width="287" alt="q3" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/a59ef473-90d2-4cc8-9d67-d41648032f0c">

    SELECT *
    FROM city;

-----
Q4. Query all columns for a city in CITY with the ID 1661.

<img width="281" alt="q4" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4594b9db-e9b8-4c8a-9f9d-a9897f65e10a">

    SELECT *
    FROM city 
    WHERE id = 1661;

-----
Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN. 

<img width="288" alt="q5" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/22bc7aaf-222a-4ef8-a261-6aaefee14d41">

    SELECT *
    FROM city
    WHERE countrycode = 'JPN';

-----
Q6. Query a list of CITY and STATE from the STATION table. 

<img width="240" alt="q6" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4b4a665c-4bf8-46eb-9b68-7330c70db6b7">
    
    SELECT city , state
    FROM station;

-----
Q7. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. 

<img width="238" alt="q7" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/ef902d64-f2d0-4b39-b76a-5c06245cd582">

    SELECT DISTINCT city
    FROM station
    WHERE MOD(id,2) = 0;

-----
Q8. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table. 

<img width="240" alt="q8" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4f101b04-6489-4522-9f9a-a6739ba2b676">

    SELECT 
        COUNT(city) - COUNT(DISTINCT city)
    FROM station;

-----
Q9. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

<img width="240" alt="q8" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4f101b04-6489-4522-9f9a-a6739ba2b676">

    SELECT city,length(city) 
    FROM station 
    ORDER BY 
        length(city) asc, city asc limit 1;
        
    SELECT distinct(City),length(city) 
    FROM station 
    ORDER BY 
        length(city) desc, city asc limit 1;

-----
Q10. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

<img width="240" alt="q8" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4f101b04-6489-4522-9f9a-a6739ba2b676">

    SELECT city
    FROM station
    WHERE 
        LEFT(city,1) in ('a','e','i','o','u');

-----
Q11. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

<img width="240" alt="q8" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4f101b04-6489-4522-9f9a-a6739ba2b676">

    SELECT DISTINCT city
    FROM station
    WHERE 
        RIGHT(city,1) in ('a','e','i','o','u');

-----
Q12. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

<img width="240" alt="q8" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4f101b04-6489-4522-9f9a-a6739ba2b676">

    SELECT DISTINCT city
    FROM STATION
    WHERE 
        RIGHT(city,1) in ('a','e','i','o','u') AND LEFT(city,1)  in ('a','e','i','o','u');

 -----
 Q13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
 
<img width="240" alt="q8" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4f101b04-6489-4522-9f9a-a6739ba2b676">

    SELECT DISTINCT city
    FROM STATION
    WHERE 
        LEFT(city,1)  NOT IN ('a','e','i','o','u');

 -----
 Q14. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

<img width="240" alt="q8" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4f101b04-6489-4522-9f9a-a6739ba2b676">

    SELECT DISTINCT city 
    FROM station 
    WHERE right(city,1) NOT in('a','e','i','o','u');

 -----
Q15. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

<img width="240" alt="q8" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4f101b04-6489-4522-9f9a-a6739ba2b676">

    SELECT distinct city 
    FROM station 
    WHERE 
        left(city,1) not in('a','e','i','o','u') OR right(city,1) not in('a','e','i','o','u');

 -----
 Q16. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

<img width="240" alt="q8" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4f101b04-6489-4522-9f9a-a6739ba2b676">

    SELECT DISTINCT city 
    FROM station 
    WHERE 
        left(city,1) not in('a','e','i','o','u') AND right(city,1) not in('a','e','i','o','u');

 -----
Q17. Query the Name of any student in STUDENTS who scored higher than Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

<img width="231" alt="q17" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/1bdf2430-823c-4625-8d9b-92b0b02f96a9">
    
    SELECT name 
    FROM students 
    WHERE marks > 75 
    ORDER BY right(name,3),id ASC;

 -----    
Q18. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

<img width="148" alt="q18" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/3946a0f5-9ad0-469c-b334-5671fd3feccb">
    
    SELECT name 
    FROM employee 
    ORDER BY name;

 -----    
 Q19. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than per month who have been employees for less than months. Sort your result by ascending employee_id.

 <img width="148" alt="q18" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/3946a0f5-9ad0-469c-b334-5671fd3feccb">

    SELECT name 
    FROM employee 
    WHERE 
         salary > 2000 AND months <10 
    ORDER BY employee_id;

 -----   
Q20. Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.

<img width="233" alt="q20" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/4819785d-8220-49ca-ac6e-c9244cff1f09">

    SELECT 
    CASE
    WHEN A + B <= C or A + C <= B or B + C <= A THEN "Not A Triangle"
    WHEN A = B and B = C THEN "Equilateral"
    WHEN A = B or A = C or B = C THEN "Isosceles"
    ELSE "Scalene"
    FROM TRIANGLES;
    
 -----  
 Q21. Query a count of the number of cities in CITY having a Population larger than.

<img width="281" alt="q21" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/af42bb4b-1371-412b-8947-eb01dedbaa99">

    SELECT COUNT(*) 
    FROM CITY 
    WHERE POPULATION > 100000;

 -----
Q22. Query the total population of all cities in CITY where District is California. 

<img width="281" alt="q21" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/af42bb4b-1371-412b-8947-eb01dedbaa99">

    SELECT SUM(POPULATION)
    FROM CITY
    WHERE DISTRICT = 'California;

 -----
 Q23. Query the average population of all cities in CITY where District is California.

<img width="281" alt="q21" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/af42bb4b-1371-412b-8947-eb01dedbaa99">

    SELECT AVG(POPULATION) as average_population
    FROM city
    WHERE district = "California";

 -----
 Q24. Query the average population for all cities in CITY, rounded down to the nearest integer.

<img width="281" alt="q21" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/af42bb4b-1371-412b-8947-eb01dedbaa99">

    SELECT FLOOR(AVG(POPULATION)) AS average_population
    FROM city;

 -----
 Q25. Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

<img width="281" alt="q21" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/af42bb4b-1371-412b-8947-eb01dedbaa99">

    SELECT SUM(population)
    FROM city
    WHERE countrycode = "JPN";

 -----
 Q26. Query the difference between the maximum and minimum populations in CITY.

<img width="281" alt="q21" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/af42bb4b-1371-412b-8947-eb01dedbaa99">

SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;

 -----
Q27. Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:average monthly salaries), and round it up to the next integer.

<img width="234" alt="q27" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/bf504b31-d5fa-4441-98a4-a40f4e7faff5">

    SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0','')))
    FROM  EMPLOYEES;

 -----
Q28. We define an employee's total earnings to be their monthly salary X months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as space-separated integers.

<img width="142" alt="q28" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/31b4038c-db42-48cf-922f-81fce533b67c">
    
    SELECT months*salary AS total_earnings ,COUNT(*)
    FROM employee
    GROUP BY total_earnings
    ORDER BY total_earnings DESC
    LIMIT 1;

 -----
 Q29. Query the following two values from the STATION table:
i)The sum of all values in LAT_N rounded to a scale of decimal places.
ii) The sum of all values in LONG_W rounded to a scale of decimal places.

<img width="236" alt="Q29" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/7b2f411b-4660-4115-867a-52e3ae4b427e">

    SELECT ROUND(SUM(LAT_N),2) , ROUND(SUM(LONG_W),2)
    FROM station;

 -----
 Q30. Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345 . Truncate your answer to decimal places.

<img width="236" alt="Q29" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/7b2f411b-4660-4115-867a-52e3ae4b427e">

    SELECT ROUND(SUM(LAT_N),4) AS total
    FROM station
    WHERE LAT_N > 38.7880 AND LAT_N<137.2345;

 -----
 Q31. Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345 . Truncate your answer to decimal places.

 <img width="236" alt="Q29" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/7b2f411b-4660-4115-867a-52e3ae4b427e">

    SELECT ROUND(MAX(LAT_N),4)
    FROM station
    WHERE LAT_N < 137.2345;
    
 -----
 Q32. Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to decimal places.

 <img width="236" alt="Q29" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/7b2f411b-4660-4115-867a-52e3ae4b427e">

    SELECT ROUND(LONG_W,4)
    FROM station
    WHERE 
        LAT_N = (SELECT MAX(LAT_N) FROM station WHERE LAT_N < 137.2345);

 -----
Q33. Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to decimal places.

 <img width="236" alt="Q29" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/7b2f411b-4660-4115-867a-52e3ae4b427e">

    SELECT ROUND(MIN(LAT_N),4)
    FROM station
    WHERE LAT_N > 38.7780;

 -----
 Q34. Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780 . Round your answer to decimal places.

 <img width="236" alt="Q29" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/7b2f411b-4660-4115-867a-52e3ae4b427e">
    
    SELECT ROUND(LONG_W,4)
    FROM station
    WHERE 
        LAT_N = (SELECT MIN(LAT_N) FROM station WHERE LAT_N > 38.7780)

  -----
  Q35. Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

<img width="281" alt="q35" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/08c5a6a7-2c8a-4a1e-ae56-6a45829d5c24">

    SELECT SUM(cy.population)
    FROM city cy
    JOIN country c
    ON cy.countrycode=c.code
    WHERE c.continent = "Asia";

  -----
  Q36. Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'. 

<img width="281" alt="q35" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/08c5a6a7-2c8a-4a1e-ae56-6a45829d5c24">

    SELECT cy.name
    FROM city cy
    JOIN country c
    ON cy.countrycode=c.code
    WHERE c.continent = "Africa";

  -----
  Q37. Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

<img width="281" alt="q35" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/08c5a6a7-2c8a-4a1e-ae56-6a45829d5c24">

    SELECT c.continent, FLOOR(AVG(cy.population))
    FROM city cy 
    JOIN country c
    ON cy.countrycode = c.code
    GROUP BY c.continent;

  -----
  Q38. P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

  <img width="75" alt="q38" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/b9d51a79-152a-4bff-8cef-7c09b7e36ce3">
    
    WITH RECURSIVE pattern_cte AS (
    SELECT 1 AS level
    UNION ALL
    SELECT level + 1
    FROM pattern_cte
    WHERE level < 20
    )
    SELECT RPAD('*', (21 - level) * 2, ' *') AS pattern
    FROM pattern_cte;

  -----
  Q39. P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

<img width="88" alt="q39" src="https://github.com/Maidira/HackerRank-SQL/assets/60576485/a6851fb2-062a-4ef7-92ff-08ce04e3c919">
    
    WITH RECURSIVE pattern_cte AS (
      SELECT 1 AS level
      UNION ALL
      SELECT level + 1
      FROM pattern_cte
      WHERE level < 20
    )
    SELECT RPAD('*', 2 * level - 1, ' *') AS pattern
    FROM pattern_cte;


