/*************************************************************************************************
 * LeetCode SQL 50: MySQL Solutions
 * 
 * Source file: README (1).md
 * Problem count: 50
 * SQL script count: 97
 * 
 * Organization
 * 1. Problems follow the order in the README table.
 * 2. Each problem includes metadata and every SQL approach found in the README.
 * 3. SQL blocks are preserved as written in the README.
 * 
 * Dialect note: The README title indicates MySQL solutions. Individual scripts are kept
 * unchanged.
 *************************************************************************************************/

/*********************************************************************************************************************
 * Index
 * 01. 1757. Recyclable and Low Fat Products (Easy) - 1 script
 * 02. 584. Find Customer Referee (Easy) - 1 script
 * 03. 595. Big Countries (Easy) - 1 script
 * 04. 1148. Article Views I (Easy) - 1 script
 * 05. 1683. Invalid Tweets (Easy) - 1 script
 * 06. 1378. Replace Employee ID With The Unique Identifier (Easy) - 1 script
 * 07. 1068. Product Sales Analysis I (Easy) - 1 script
 * 08. 1581. Customer Who Visited but Did Not Make Any Transactions (Easy) - 1 script
 * 09. 197. Rising Temperature (Easy) - 5 scripts
 * 10. 1661. Average Time of Process per Machine (Easy) - 3 scripts
 * 11. 577. Employee Bonus (Easy) - 2 scripts
 * 12. 1280. Students and Examinations (Easy) - 2 scripts
 * 13. 620. Not Boring Movies (Easy) - 2 scripts
 * 14. 1251. Average Selling Price (Easy) - 2 scripts
 * 15. 570. Managers with at Least 5 Direct Reports (Medium) - 2 scripts
 * 16. 1934. Confirmation Rate (Medium) - 3 scripts
 * 17. 1075. Project Employees I (Easy) - 2 scripts
 * 18. 1633. Percentage of Users Attended a Contest (Easy) - 2 scripts
 * 19. 1211. Queries Quality and Percentage (Easy) - 2 scripts
 * 20. 1193. Monthly Transactions I (Medium) - 3 scripts
 * 21. 1174. Immediate Food Delivery II (Medium) - 1 script
 * 22. 550. Game Play Analysis IV (Medium) - 3 scripts
 * 23. 2356. Number of Unique Subjects Taught by Each Teacher (Easy) - 1 script
 * 24. 1141. User Activity for the Past 30 Days I (Easy) - 3 scripts
 * 25. 1070. Product Sales Analysis III (Medium) - 3 scripts
 * 26. 596. Classes With at Least 5 Students (Easy) - 2 scripts
 * 27. 1729. Find Followers Count (Easy) - 1 script
 * 28. 619. Biggest Single Number (Easy) - 1 script
 * 29. 1045. Customers Who Bought All Products (Medium) - 1 script
 * 30. 1731. The Number of Employees Which Report to Each Employee (Easy) - 2 scripts
 * 31. 1789. Primary Department for Each Employee (Easy) - 3 scripts
 * 32. 610. Triangle Judgement (Easy) - 1 script
 * 33. 180. Consecutive Numbers (Medium) - 2 scripts
 * 34. 1164. Product Price at a Given Date (Medium) - 3 scripts
 * 35. 1204. Last Person to Fit in the Bus (Medium) - 4 scripts
 * 36. 1907. Count Salary Categories (Medium) - 2 scripts
 * 37. 1978. Employees Whose Manager Left the Company (Easy) - 2 scripts
 * 38. 626. Exchange Seats (Medium) - 3 scripts
 * 39. 1341. Movie Rating (Medium) - 3 scripts
 * 40. 1321. Restaurant Growth (Medium) - 2 scripts
 * 41. 602. Friend Requests II: Who Has the Most Friends (Medium) - 1 script
 * 42. 585. Investments in 2016 (Medium) - 2 scripts
 * 43. 185. Department Top Three Salaries (Hard) - 1 script
 * 44. 1667. Fix Names in a Table (Easy) - 2 scripts
 * 45. 1527. Patients With a Condition (Easy) - 2 scripts
 * 46. 196. Delete Duplicate Emails (Easy) - 1 script
 * 47. 176. Second Highest Salary (Medium) - 3 scripts
 * 48. 1484. Group Sold Products By The Date (Easy) - 1 script
 * 49. 1327. List the Products Ordered in a Period (Easy) - 2 scripts
 * 50. 1517. Find Users With Valid E-Mails (Easy) - 1 script
 *********************************************************************************************************************/

/*********************************************************************************************************************
 * Problem 01: 1757. Recyclable and Low Fat Products
 * Difficulty: Easy
 * Key techniques: WHERE filter
 * Best performance: not listed
 * URL: https://leetcode.com/problems/recyclable-and-low-fat-products/
 * Description: Find all products that are both low fat and recyclable.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 ***************************************************************************************************/
SELECT product_id FROM products WHERE low_fats = 'Y' AND recyclable = 'Y';


/*********************************************************************************************************************
 * Problem 02: 584. Find Customer Referee
 * Difficulty: Easy
 * Key techniques: WHERE + IS NULL
 * Best performance: not listed
 * URL: https://leetcode.com/problems/find-customer-referee/
 * Description: Find all customers who were not referred by a specific customer.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 ***************************************************************************************************/
SELECT name FROM customer WHERE referee_id != 2 OR referee_id IS NULL;


/*********************************************************************************************************************
 * Problem 03: 595. Big Countries
 * Difficulty: Easy
 * Key techniques: WHERE + OR
 * Best performance: not listed
 * URL: https://leetcode.com/problems/big-countries/
 * Description: Find all countries that are either very large in area or have a very large population.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 ***************************************************************************************************/
SELECT name, population, area FROM world WHERE area >= 3000000 OR population >= 25000000;


/*********************************************************************************************************************
 * Problem 04: 1148. Article Views I
 * Difficulty: Easy
 * Key techniques: DISTINCT, self-compare
 * Best performance: not listed
 * URL: https://leetcode.com/problems/article-views-i/
 * Description: Find all authors who have viewed at least one of their own articles.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 ***************************************************************************************************/
SELECT DISTINCT author_id AS id FROM views WHERE author_id = viewer_id ORDER BY author_id;


/*********************************************************************************************************************
 * Problem 05: 1683. Invalid Tweets
 * Difficulty: Easy
 * Key techniques: LENGTH()
 * Best performance: not listed
 * URL: https://leetcode.com/problems/invalid-tweets/
 * Description: Find all tweets whose content exceeds the allowed character length.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 ***************************************************************************************************/
SELECT tweet_id FROM tweets WHERE LENGTH(content) > 15;


/*********************************************************************************************************************
 * Problem 06: 1378. Replace Employee ID With The Unique Identifier
 * Difficulty: Easy
 * Key techniques: LEFT JOIN
 * Best performance: not listed
 * URL: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
 * Description: Display each employee's unique identifier alongside their name, showing null if no mapping exists.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 ***************************************************************************************************/
SELECT U.unique_id, E.name FROM employees E LEFT JOIN employeeuni U ON E.id = U.id;


/*********************************************************************************************************************
 * Problem 07: 1068. Product Sales Analysis I
 * Difficulty: Easy
 * Key techniques: JOIN
 * Best performance: not listed
 * URL: https://leetcode.com/problems/product-sales-analysis-i/
 * Description: Report the product name, year, and price for every entry in the sales table.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 ***************************************************************************************************/
SELECT P.product_name, S.year, S.price FROM sales S JOIN product P ON S.product_id = P.product_id;


/*********************************************************************************************************************
 * Problem 08: 1581. Customer Who Visited but Did Not Make Any Transactions
 * Difficulty: Easy
 * Key techniques: LEFT JOIN + IS NULL
 * Best performance: not listed
 * URL: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
 * Description: Find customers who visited but made no transactions, along with how many times that occurred.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 ***************************************************************************************************/
SELECT V.customer_id, COUNT(*) AS count_no_trans
FROM Visits V
LEFT JOIN Transactions T
  ON V.visit_id = T.visit_id
WHERE T.visit_id IS NULL
GROUP BY V.customer_id;


/*********************************************************************************************************************
 * Problem 09: 197. Rising Temperature
 * Difficulty: Easy
 * Key techniques: LAG, Self Join, EXISTS
 * Best performance: 98.38%
 * URL: https://leetcode.com/problems/rising-temperature/
 * Description: Find all dates where the temperature was higher than the previous day's temperature.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 5: Using LAG
 * Performance: Beats 39.26%
 ***************************************************************************************************/
SELECT id
FROM (
  SELECT id, recordDate, temperature,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
    LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
  FROM weather
) w
WHERE prev_date = recordDate - INTERVAL '1' DAY
  AND temperature > prev_temp;

/***************************************************************************************************
 * Approach 2 of 5: Using Self Join
 * Performance: Beats 79.80%
 ***************************************************************************************************/
SELECT w1.id
FROM weather w1
JOIN weather w2
  ON w2.recordDate = w1.recordDate - INTERVAL '1' DAY
WHERE w1.temperature > w2.temperature;

/***************************************************************************************************
 * Approach 3 of 5: Using Correlated Subquery
 * Performance: Beats 86.73%
 ***************************************************************************************************/
SELECT id FROM weather w1
WHERE w1.temperature > (
  SELECT w2.temperature FROM weather w2
  WHERE w2.recordDate = w1.recordDate - INTERVAL '1' DAY
);

/***************************************************************************************************
 * Approach 4 of 5: Using EXISTS
 * Performance: Beats 93.08%
 ***************************************************************************************************/
SELECT w1.id
FROM Weather w1
WHERE EXISTS (
  SELECT 1
  FROM Weather w2
  WHERE w2.recordDate = w1.recordDate - INTERVAL '1' DAY
    AND w1.temperature > w2.temperature
);

/***************************************************************************************************
 * Approach 5 of 5: Using Window Function with DATE_DIFF
 * Performance: Beats 98.38%
 ***************************************************************************************************/
SELECT id
FROM (
  SELECT
    id,
    recordDate,
    temperature,
    LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp
  FROM Weather
)
WHERE DATE_DIFF(recordDate, prev_date, DAY) = 1
  AND temperature > prev_temp;


/*********************************************************************************************************************
 * Problem 10: 1661. Average Time of Process per Machine
 * Difficulty: Easy
 * Key techniques: Conditional Agg, Self Join
 * Best performance: 77.22%
 * URL: https://leetcode.com/problems/average-time-of-process-per-machine/
 * Description: Calculate the average time each machine takes to complete a process across all its process runs.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using Conditional Aggregation in Subquery
 * Performance: Beats 63.83%
 ***************************************************************************************************/
SELECT machine_id, ROUND(AVG(process_time), 3) AS processing_time
FROM (
  SELECT machine_id, process_id,
    MAX(CASE WHEN activity_type = 'end' THEN timestamp END)
    -
    MAX(CASE WHEN activity_type = 'start' THEN timestamp END)
    AS process_time
  FROM activity
  GROUP BY machine_id, process_id
) t
GROUP BY machine_id;

/***************************************************************************************************
 * Approach 2 of 3: Using Correlated Subquery
 * Performance: Beats 68.33%
 ***************************************************************************************************/
SELECT machine_id, ROUND(AVG((SELECT a2.timestamp FROM activity a2
  WHERE a2.machine_id = a1.machine_id
    AND a2.process_id = a1.process_id
    AND a2.activity_type = 'end') - a1.timestamp), 3) AS processing_time
FROM activity a1
WHERE a1.activity_type = 'start'
GROUP BY machine_id;

/***************************************************************************************************
 * Approach 3 of 3: Using Self Join
 * Performance: Beats 77.22%
 ***************************************************************************************************/
SELECT s.machine_id, ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM activity s
JOIN activity e
  ON s.machine_id = e.machine_id
  AND s.process_id = e.process_id
  AND e.activity_type = 'end'
WHERE s.activity_type = 'start'
GROUP BY s.machine_id;


/*********************************************************************************************************************
 * Problem 11: 577. Employee Bonus
 * Difficulty: Easy
 * Key techniques: LEFT JOIN, COALESCE
 * Best performance: not listed
 * URL: https://leetcode.com/problems/employee-bonus/
 * Description: Report the name and bonus of each employee whose bonus is less than 1000 or who has no bonus at
 * all.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Simple
 ***************************************************************************************************/
SELECT e.name, b.bonus FROM employee e LEFT JOIN bonus b ON e.empId = b.empId
WHERE bonus < 1000 OR bonus IS NULL;

/***************************************************************************************************
 * Approach 2 of 2: Using COALESCE
 ***************************************************************************************************/
SELECT e.name, b.bonus FROM employee e LEFT JOIN bonus b ON e.empId = b.empId
WHERE COALESCE(b.bonus, 0) < 1000;


/*********************************************************************************************************************
 * Problem 12: 1280. Students and Examinations
 * Difficulty: Easy
 * Key techniques: CROSS JOIN, LEFT JOIN
 * Best performance: 85.65%
 * URL: https://leetcode.com/problems/students-and-examinations/
 * Description: For every student and every subject, report how many times that student attended an exam for that
 * subject.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using CROSS JOIN
 * Performance: Beats 52.62%
 ***************************************************************************************************/
SELECT st.student_id, st.student_name, su.subject_name, COUNT(e.subject_name) AS attended_exams
FROM students st CROSS JOIN subjects su LEFT JOIN examinations e
    ON st.student_id = e.student_id AND e.subject_name = su.subject_name
GROUP BY st.student_id, st.student_name, su.subject_name
ORDER BY st.student_id, st.student_name;

/***************************************************************************************************
 * Approach 2 of 2: Using LEFT JOIN
 * Performance: Beats 85.65%
 ***************************************************************************************************/
SELECT S.student_id, S.student_name, Su.subject_name, COUNT(E.student_id) AS attended_exams
FROM students S
JOIN subjects Su
LEFT JOIN examinations E
  ON S.student_id = E.student_id
  AND Su.subject_name = E.subject_name
GROUP BY S.student_id, Su.subject_name
ORDER BY student_id, subject_name;


/*********************************************************************************************************************
 * Problem 13: 620. Not Boring Movies
 * Difficulty: Easy
 * Key techniques: MOD, Bitwise &
 * Best performance: 81.48%
 * URL: https://leetcode.com/problems/not-boring-movies/
 * Description: Find movies with an odd-numbered ID and a description that is not "boring", sorted by rating
 * descending.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using MOD (%)
 * Performance: Beats 79.67%
 ***************************************************************************************************/
SELECT id, movie, description, rating FROM cinema
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC;

/***************************************************************************************************
 * Approach 2 of 2: Using Bitwise AND (&)
 * Performance: Beats 81.48%
 ***************************************************************************************************/
SELECT id, movie, description, rating FROM cinema
WHERE id & 1 = 1 AND description <> 'boring'
ORDER BY rating DESC;


/*********************************************************************************************************************
 * Problem 14: 1251. Average Selling Price
 * Difficulty: Easy
 * Key techniques: LEFT JOIN, NULLIF, pre-agg
 * Best performance: 81.32%
 * URL: https://leetcode.com/problems/average-selling-price/
 * Description: Calculate the average selling price for each product weighted by the number of units sold.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: JOIN first, AGG later
 * Performance: Beats 35.36%
 ***************************************************************************************************/
SELECT P.product_id,
  ROUND(COALESCE(SUM(P.price * U.units) / NULLIF(SUM(U.units), 0), 0), 2) AS average_price
FROM prices P
LEFT JOIN unitssold U
  ON P.product_id = U.product_id
  AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id;

/***************************************************************************************************
 * Approach 2 of 2: AGG first, JOIN later
 * Performance: Beats 81.32%
 ***************************************************************************************************/
SELECT P.product_id,
  ROUND(IFNULL(SUM(P.price * units_sum) / SUM(units_sum), 0), 2) AS average_price
FROM prices P
LEFT JOIN (
  SELECT product_id, purchase_date, SUM(units) AS units_sum
  FROM unitssold
  GROUP BY product_id, purchase_date
) U
  ON P.product_id = U.product_id
  AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id;


/*********************************************************************************************************************
 * Problem 15: 570. Managers with at Least 5 Direct Reports
 * Difficulty: Medium
 * Key techniques: IN, JOIN + HAVING
 * Best performance: 93.51%
 * URL: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
 * Description: Find managers who have at least five employees reporting directly to them.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using IN
 * Performance: Beats 91.05%
 ***************************************************************************************************/
SELECT e.name FROM employee e
WHERE e.id IN (SELECT managerId FROM employee
                WHERE managerId IS NOT NULL
                GROUP BY managerId
                HAVING COUNT(*) > 4);

/***************************************************************************************************
 * Approach 2 of 2: Using JOIN
 * Performance: Beats 93.51%
 ***************************************************************************************************/
SELECT e.name FROM employee e
JOIN (
  SELECT managerId FROM employee
  WHERE managerId IS NOT NULL
  GROUP BY managerId
  HAVING COUNT(*) > 4
) m ON e.id = m.managerId;


/*********************************************************************************************************************
 * Problem 16: 1934. Confirmation Rate
 * Difficulty: Medium
 * Key techniques: AVG, IF, pre-agg subquery
 * Best performance: 82.92%
 * URL: https://leetcode.com/problems/confirmation-rate/
 * Description: Calculate the rate at which each user confirmed their messages out of all messages sent to them.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using COALESCE
 * Performance: Beats 39.9%
 ***************************************************************************************************/
SELECT S.user_id,
  ROUND(COALESCE(AVG(C.action = 'confirmed'), 0), 2) AS confirmation_rate
FROM signups S
LEFT JOIN confirmations C ON S.user_id = C.user_id
GROUP BY user_id;

/***************************************************************************************************
 * Approach 2 of 3: Using IF
 * Performance: Beats 64.95%
 ***************************************************************************************************/
SELECT S.user_id,
  ROUND(AVG(IF(c.action = 'confirmed', 1, 0)), 2) AS confirmation_rate
FROM signups S
LEFT JOIN confirmations C ON S.user_id = C.user_id
GROUP BY user_id;

/***************************************************************************************************
 * Approach 3 of 3: AGG first, JOIN later
 * Performance: Beats 82.92%
 ***************************************************************************************************/
SELECT s.user_id,
  ROUND(COALESCE(c.confirmed / c.total, 0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN (
  SELECT user_id,
    SUM(action = 'confirmed') AS confirmed,
    COUNT(*) AS total
  FROM Confirmations
  GROUP BY user_id
) c ON s.user_id = c.user_id;


/*********************************************************************************************************************
 * Problem 17: 1075. Project Employees I
 * Difficulty: Easy
 * Key techniques: AVG, SUM/COUNT
 * Best performance: 85.58%
 * URL: https://leetcode.com/problems/project-employees-i/
 * Description: Find the average years of experience of employees assigned to each project.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using AVG
 * Performance: Beats 70.76%
 ***************************************************************************************************/
SELECT project_id, ROUND(AVG(E.experience_years), 2) AS average_years
FROM project P JOIN employee E ON P.employee_id = E.employee_id
GROUP BY project_id;

/***************************************************************************************************
 * Approach 2 of 2: Using SUM / COUNT
 * Performance: Beats 85.58%
 ***************************************************************************************************/
SELECT project_id, ROUND(SUM(E.experience_years)/COUNT(*), 2) AS average_years
FROM project P JOIN employee E ON P.employee_id = E.employee_id
GROUP BY project_id;


/*********************************************************************************************************************
 * Problem 18: 1633. Percentage of Users Attended a Contest
 * Difficulty: Easy
 * Key techniques: Scalar subquery, CROSS JOIN
 * Best performance: 73.76%
 * URL: https://leetcode.com/problems/percentage-of-users-attended-a-contest/
 * Description: Calculate the percentage of all users who registered for each contest, sorted by percentage then
 * contest ID.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using Scalar Subquery
 * Performance: Beats 73.76%
 ***************************************************************************************************/
SELECT contest_id,
    ROUND((COUNT(user_id)/(SELECT COUNT(*) FROM users)) * 100, 2) AS percentage
FROM register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;

/***************************************************************************************************
 * Approach 2 of 2: Using CROSS JOIN
 * Performance: Beats 73.23%
 ***************************************************************************************************/
SELECT contest_id,
    ROUND((COUNT(R.user_id)/ U.total) * 100, 2) AS percentage
FROM register R
CROSS JOIN (SELECT COUNT(*) AS total FROM users) U
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;


/*********************************************************************************************************************
 * Problem 19: 1211. Queries Quality and Percentage
 * Difficulty: Easy
 * Key techniques: AVG, SUM, CASE WHEN
 * Best performance: 96.29%
 * URL: https://leetcode.com/problems/queries-quality-and-percentage/
 * Description: For each query, calculate its average quality rating and the percentage of its results rated as
 * poor.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using SUM
 * Performance: Beats 42.94%
 ***************************************************************************************************/
SELECT query_name,
    ROUND(AVG(rating/position), 2) AS quality,
    ROUND(SUM(rating < 3)*100/COUNT(rating), 2) AS poor_query_percentage
FROM queries
GROUP BY query_name;

/***************************************************************************************************
 * Approach 2 of 2: Using CASE WHEN
 * Performance: Beats 96.29%
 ***************************************************************************************************/
SELECT query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100, 2) AS poor_query_percentage
FROM queries
WHERE query_name IS NOT NULL
GROUP BY query_name;


/*********************************************************************************************************************
 * Problem 20: 1193. Monthly Transactions I
 * Difficulty: Medium
 * Key techniques: DATE_FORMAT, LEFT, CASE WHEN
 * Best performance: 87.21%
 * URL: https://leetcode.com/problems/monthly-transactions-i/
 * Description: For each month and country, summarize the total number of transactions and the count and amount of
 * approved ones.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using DATE_FORMAT
 * Performance: Beats 39.53%
 ***************************************************************************************************/
SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month, country,
    COUNT(trans_date) AS trans_count,
    SUM(state='approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY month, country;

/***************************************************************************************************
 * Approach 2 of 3: Using LEFT
 * Performance: Beats 78.97%
 ***************************************************************************************************/
SELECT LEFT(trans_date, 7) AS month, country,
    COUNT(trans_date) AS trans_count,
    SUM(state='approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY month, country;

/***************************************************************************************************
 * Approach 3 of 3: Using CASE WHEN x2
 * Performance: Beats 87.21%
 ***************************************************************************************************/
SELECT LEFT(trans_date, 7) AS month, country,
    COUNT(trans_date) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY month, country;


/*********************************************************************************************************************
 * Problem 21: 1174. Immediate Food Delivery II
 * Difficulty: Medium
 * Key techniques: Subquery, MIN
 * Best performance: 90.40%
 * URL: https://leetcode.com/problems/immediate-food-delivery-ii/
 * Description: Find the percentage of customers whose first-ever order was an immediate delivery.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 * Performance: Beats 90.67%
 ***************************************************************************************************/
SELECT ROUND(SUM(first_order = first_del) * 100 / COUNT(*), 2) AS immediate_percentage
FROM (
  SELECT customer_id, MIN(order_date) AS first_order,
    MIN(customer_pref_delivery_date) AS first_del
  FROM delivery
  GROUP BY customer_id
) f;


/*********************************************************************************************************************
 * Problem 22: 550. Game Play Analysis IV
 * Difficulty: Medium
 * Key techniques: CTE, Subquery, Window Function
 * Best performance: 96.18%
 * URL: https://leetcode.com/problems/game-play-analysis-iv/
 * Description: Find the fraction of players who logged in again the day immediately after their first login.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using CTE
 * Performance: Beats 18.92%
 ***************************************************************************************************/
WITH first_login AS (
  SELECT player_id, MIN(event_date) AS first_date
  FROM activity
  GROUP BY player_id
)
SELECT ROUND(COUNT(A.player_id) / COUNT(F.player_id), 2) AS fraction
FROM first_login F
LEFT JOIN activity A
  ON F.player_id = A.player_id
  AND A.event_date = DATE_ADD(F.first_date, INTERVAL 1 DAY);

/***************************************************************************************************
 * Approach 2 of 3: Using Subquery
 * Performance: Beats 82.32%
 ***************************************************************************************************/
SELECT ROUND(COUNT(A.player_id) / COUNT(F.player_id), 2) AS fraction
FROM (
  SELECT player_id, MIN(event_date) AS first_date
  FROM activity
  GROUP BY player_id
) F
LEFT JOIN activity A
  ON F.player_id = A.player_id
  AND A.event_date = DATE_ADD(F.first_date, INTERVAL 1 DAY);

/***************************************************************************************************
 * Approach 3 of 3: Using Window Function
 * Performance: Beats 96.18%
 ***************************************************************************************************/
SELECT ROUND(
  SUM(CASE WHEN DATEDIFF(event_date, first_date) = 1 THEN 1 ELSE 0 END) /
  COUNT(DISTINCT player_id), 2
) AS fraction
FROM (
  SELECT player_id, event_date,
    MIN(event_date) OVER (PARTITION BY player_id) AS first_date
  FROM Activity
) T;


/*********************************************************************************************************************
 * Problem 23: 2356. Number of Unique Subjects Taught by Each Teacher
 * Difficulty: Easy
 * Key techniques: COUNT DISTINCT
 * Best performance: 90.92%
 * URL: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/
 * Description: Count how many distinct subjects each teacher teaches across all departments.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 * Performance: Beats 91.25%
 ***************************************************************************************************/
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id;


/*********************************************************************************************************************
 * Problem 24: 1141. User Activity for the Past 30 Days I
 * Difficulty: Easy
 * Key techniques: BETWEEN, COUNT DISTINCT
 * Best performance: 81.29%
 * URL: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
 * Description: Count the number of active users per day within a specific 30-day window.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using BETWEEN
 * Performance: Beats 60.32%
 ***************************************************************************************************/
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;

/***************************************************************************************************
 * Approach 2 of 3: Using Subquery
 * Performance: Beats 57.18%
 ***************************************************************************************************/
SELECT activity_date AS day, COUNT(user_id) AS active_users
FROM (
  SELECT DISTINCT activity_date, user_id
  FROM activity
  WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
) A
GROUP BY activity_date;

/***************************************************************************************************
 * Approach 3 of 3: Using Direct Range Operators
 * Performance: Beats 81.29%
 ***************************************************************************************************/
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE activity_date > '2019-06-27' AND activity_date <= '2019-07-27'
GROUP BY activity_date;


/*********************************************************************************************************************
 * Problem 25: 1070. Product Sales Analysis III
 * Difficulty: Medium
 * Key techniques: JOIN, RANK(), Tuple IN
 * Best performance: 84.71%
 * URL: https://leetcode.com/problems/product-sales-analysis-iii/
 * Description: For each product, report the first year it was ever sold along with the quantity and price that
 * year.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using JOIN
 * Performance: Beats 18.85%
 ***************************************************************************************************/
SELECT S.product_id, S.year AS first_year, S.quantity, S.price
FROM sales S
JOIN (
  SELECT product_id, MIN(year) AS first_year FROM sales
  GROUP BY product_id
) F ON S.product_id = F.product_id AND S.year = F.first_year;

/***************************************************************************************************
 * Approach 2 of 3: Using RANK()
 * Performance: Beats 44.65%
 ***************************************************************************************************/
SELECT product_id, year AS first_year, quantity, price
FROM (
  SELECT product_id, year, quantity, price,
    RANK() OVER (PARTITION BY product_id ORDER BY year) AS rnk
  FROM sales
) R
WHERE rnk = 1;

/***************************************************************************************************
 * Approach 3 of 3: Using Tuple IN
 * Performance: Beats 84.71%
 ***************************************************************************************************/
SELECT product_id, year AS first_year, quantity, price
FROM sales
WHERE (product_id, year) IN (
  SELECT product_id, MIN(year) FROM sales
  GROUP BY product_id
);


/*********************************************************************************************************************
 * Problem 26: 596. Classes With at Least 5 Students
 * Difficulty: Easy
 * Key techniques: HAVING, COUNT DISTINCT
 * Best performance: not listed
 * URL: https://leetcode.com/problems/classes-more-than-5-students/
 * Description: Find all classes that have at least five students enrolled.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using DISTINCT
 ***************************************************************************************************/
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;

/***************************************************************************************************
 * Approach 2 of 2: Simple
 ***************************************************************************************************/
SELECT class
FROM courses
GROUP BY 1
HAVING COUNT(DISTINCT student) > 4;


/*********************************************************************************************************************
 * Problem 27: 1729. Find Followers Count
 * Difficulty: Easy
 * Key techniques: COUNT, GROUP BY
 * Best performance: 86.10%
 * URL: https://leetcode.com/problems/find-followers-count/
 * Description: Report the number of followers each user has, sorted by user ID.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 * Performance: Beats 86.10%
 ***************************************************************************************************/
SELECT user_id, COUNT(follower_id) AS followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id;


/*********************************************************************************************************************
 * Problem 28: 619. Biggest Single Number
 * Difficulty: Easy
 * Key techniques: Subquery, MAX, HAVING
 * Best performance: 81.94%
 * URL: https://leetcode.com/problems/biggest-single-number/
 * Description: Find the largest number that appears exactly once in the table, or null if no such number exists.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 * Performance: Beats 81.94%
 ***************************************************************************************************/
SELECT MAX(num) AS num
FROM (
  SELECT num FROM mynumbers
  GROUP BY num
  HAVING COUNT(*) = 1
) N;


/*********************************************************************************************************************
 * Problem 29: 1045. Customers Who Bought All Products
 * Difficulty: Medium
 * Key techniques: HAVING, COUNT DISTINCT
 * Best performance: 75.88%
 * URL: https://leetcode.com/problems/customers-who-bought-all-products/
 * Description: Find all customers who have purchased every single product in the product table.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 * Performance: Beats 75.88%
 ***************************************************************************************************/
SELECT customer_id FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM product);


/*********************************************************************************************************************
 * Problem 30: 1731. The Number of Employees Which Report to Each Employee
 * Difficulty: Easy
 * Key techniques: Self Join, Subquery
 * Best performance: 62.73%
 * URL: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
 * Description: For each manager, report the number of direct reports and the average age of those reports rounded
 * to the nearest integer.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Subquery Aggregates First, Then Join
 * Performance: Beats 44.82%
 ***************************************************************************************************/
SELECT E.employee_id, E.name, M.reports_count, M.average_age
FROM employees E
JOIN (
  SELECT reports_to, COUNT(*) AS reports_count, ROUND(AVG(age)) AS average_age
  FROM employees
  WHERE reports_to IS NOT NULL
  GROUP BY reports_to
) M ON E.employee_id = M.reports_to
ORDER BY E.employee_id;

/***************************************************************************************************
 * Approach 2 of 2: Direct Join, Aggregates After
 * Performance: Beats 62.73%
 ***************************************************************************************************/
SELECT M.employee_id, M.name, COUNT(*) AS reports_count, ROUND(AVG(E.age)) AS average_age
FROM Employees M
JOIN Employees E ON E.reports_to = M.employee_id
GROUP BY M.employee_id
ORDER BY M.employee_id;


/*********************************************************************************************************************
 * Problem 31: 1789. Primary Department for Each Employee
 * Difficulty: Easy
 * Key techniques: UNION ALL, PARTITION BY
 * Best performance: 70.77%
 * URL: https://leetcode.com/problems/primary-department-for-each-employee/
 * Description: Find the primary department for each employee — the single department if they only belong to one,
 * or the one flagged as primary.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using UNION ALL
 * Performance: Beats 46.54%
 ***************************************************************************************************/
SELECT employee_id, department_id FROM employee
GROUP BY employee_id
HAVING COUNT(*) = 1

UNION ALL

SELECT employee_id, department_id FROM employee
WHERE primary_flag = 'Y';

/***************************************************************************************************
 * Approach 2 of 3: Using PARTITION BY
 * Performance: Beats 63.04%
 ***************************************************************************************************/
SELECT employee_id, department_id
FROM (
  SELECT employee_id, department_id, primary_flag,
    COUNT(*) OVER (PARTITION BY employee_id) AS dept_count
  FROM employee
) E
WHERE primary_flag = 'Y' OR dept_count = 1;

/***************************************************************************************************
 * Approach 3 of 3: Simple
 * Performance: Beats 70.77%
 ***************************************************************************************************/
SELECT employee_id, department_id FROM employee
WHERE primary_flag = 'Y'
OR employee_id IN (
  SELECT employee_id FROM employee
  GROUP BY employee_id
  HAVING COUNT(*) = 1
);


/*********************************************************************************************************************
 * Problem 32: 610. Triangle Judgement
 * Difficulty: Easy
 * Key techniques: CASE WHEN
 * Best performance: 86.78%
 * URL: https://leetcode.com/problems/triangle-judgement/
 * Description: For each row of three side lengths, determine whether they can form a valid triangle.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 * Performance: Beats 86.78%
 ***************************************************************************************************/
SELECT x, y, z,
  CASE WHEN x+y > z AND y+z > x AND x+z > y THEN 'Yes' ELSE 'No' END AS triangle
FROM triangle;


/*********************************************************************************************************************
 * Problem 33: 180. Consecutive Numbers
 * Difficulty: Medium
 * Key techniques: LAG/LEAD, Self Join
 * Best performance: 77.29%
 * URL: https://leetcode.com/problems/consecutive-numbers/
 * Description: Find all numbers that appear at least three times consecutively in the table.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using LAG() and LEAD()
 * Performance: Beats 20.76%
 ***************************************************************************************************/
SELECT DISTINCT num AS ConsecutiveNums
FROM (
  SELECT num,
    LAG(num) OVER (ORDER BY id) AS prev,
    LEAD(num) OVER (ORDER BY id) AS next
  FROM logs
) N
WHERE N.num = N.prev AND N.num = N.next;

/***************************************************************************************************
 * Approach 2 of 2: Simple Self Join
 * Performance: Beats 77.29%
 ***************************************************************************************************/
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM logs l1
JOIN logs l2 ON l2.id = l1.id + 1 AND l2.num = l1.num
JOIN logs l3 ON l3.id = l1.id + 2 AND l3.num = l1.num;


/*********************************************************************************************************************
 * Problem 34: 1164. Product Price at a Given Date
 * Difficulty: Medium
 * Key techniques: Subquery, UNION, CTE
 * Best performance: 63.65%
 * URL: https://leetcode.com/problems/product-price-at-a-given-date/
 * Description: Find the price of each product on a specific date, defaulting to 10 if no price change had occurred
 * before that date.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using Subquery
 * Performance: Beats 63.65%
 ***************************************************************************************************/
SELECT DISTINCT P.product_id, COALESCE(Q.new_price, 10) AS price
FROM products P
LEFT JOIN (
  SELECT product_id, new_price FROM products
  WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date)
    FROM products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
  )
) Q ON P.product_id = Q.product_id;

/***************************************************************************************************
 * Approach 2 of 3: Using UNION
 * Performance: Beats 54.30%
 ***************************************************************************************************/
SELECT DISTINCT product_id,
  FIRST_VALUE(new_price) OVER (PARTITION BY product_id ORDER BY change_date DESC) AS price
FROM products
WHERE change_date <= '2019-08-16'

UNION

SELECT DISTINCT product_id, 10
FROM products
WHERE product_id NOT IN (
  SELECT product_id FROM products WHERE change_date <= '2019-08-16'
);

/***************************************************************************************************
 * Approach 3 of 3: Using CTE
 * Performance: Beats 46.53%
 ***************************************************************************************************/
WITH CTE AS (
  SELECT *, RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rnk
  FROM Products
  WHERE change_date <= '2019-08-16'
)
SELECT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'

UNION ALL

SELECT product_id, new_price
FROM CTE
WHERE rnk = 1;


/*********************************************************************************************************************
 * Problem 35: 1204. Last Person to Fit in the Bus
 * Difficulty: Medium
 * Key techniques: Running sum, CTE, Variables
 * Best performance: 64.79%
 * URL: https://leetcode.com/problems/last-person-to-fit-in-the-bus/
 * Description: Find the name of the last person who can board the bus without the total weight exceeding the
 * limit.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 4: Using Subquery
 * Performance: Beats 64.79%
 ***************************************************************************************************/
SELECT person_name
FROM (
  SELECT person_name, turn,
    SUM(weight) OVER (ORDER BY turn) AS running_weight
  FROM queue
) q
WHERE running_weight <= 1000
ORDER BY turn DESC
LIMIT 1;

/***************************************************************************************************
 * Approach 2 of 4: Using CTE
 * Performance: Beats 48.92%
 ***************************************************************************************************/
WITH W AS (
  SELECT *,
    SUM(weight) OVER (ORDER BY turn) AS running_weight
  FROM queue
)
SELECT person_name FROM W
WHERE running_weight < 1001
ORDER BY turn DESC
LIMIT 1;

/***************************************************************************************************
 * Approach 3 of 4: Using MySQL Variables
 * Performance: Beats 63.08%
 ***************************************************************************************************/
SELECT person_name
FROM (
  SELECT person_name, turn,
    @total := @total + weight AS running_weight
  FROM queue, (SELECT @total := 0) T
  ORDER BY turn
) W
WHERE running_weight <= 1000
ORDER BY turn DESC
LIMIT 1;

/***************************************************************************************************
 * Approach 4 of 4: Using JOIN
 * Performance: Beats 7.90%
 ***************************************************************************************************/
SELECT q1.person_name
FROM queue q1
JOIN queue q2 ON q2.turn <= q1.turn
GROUP BY q1.turn, q1.person_name
HAVING SUM(q2.weight) <= 1000
ORDER BY q1.turn DESC
LIMIT 1;


/*********************************************************************************************************************
 * Problem 36: 1907. Count Salary Categories
 * Difficulty: Medium
 * Key techniques: UNION ALL, CTE
 * Best performance: 96.78%
 * URL: https://leetcode.com/problems/count-salary-categories/
 * Description: Count how many employees fall into each of three salary categories: low, average, and high.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using UNION ALL
 * Performance: Beats 34.88%
 ***************************************************************************************************/
SELECT 'High Salary' AS category, SUM(income > 50000) AS accounts_count FROM accounts
UNION ALL
SELECT 'Average Salary', SUM(income >= 20000 AND income <= 50000) FROM accounts
UNION ALL
SELECT 'Low Salary', SUM(income < 20000) FROM accounts;

/***************************************************************************************************
 * Approach 2 of 2: Using CTE
 * Performance: Beats 96.78%
 ***************************************************************************************************/
WITH categories AS (
  SELECT
    SUM(income > 50000) AS high_salary,
    SUM(income >= 20000 AND income <= 50000) AS avg_salary,
    SUM(income < 20000) AS low_salary
  FROM accounts
)
SELECT 'High Salary' AS category, high_salary AS accounts_count FROM categories
UNION ALL
SELECT 'Average Salary', avg_salary FROM categories
UNION ALL
SELECT 'Low Salary', low_salary FROM categories;


/*********************************************************************************************************************
 * Problem 37: 1978. Employees Whose Manager Left the Company
 * Difficulty: Easy
 * Key techniques: LEFT JOIN, Subquery
 * Best performance: 82.67%
 * URL: https://leetcode.com/problems/employees-whose-manager-left-the-company/
 * Description: Find employees with a low salary whose manager no longer exists in the company.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using LEFT JOIN
 * Performance: Beats 82.67%
 ***************************************************************************************************/
SELECT X.employee_id FROM employees X
LEFT JOIN employees Y ON X.manager_id = Y.employee_id
WHERE X.salary < 30000 AND X.manager_id IS NOT NULL AND Y.employee_id IS NULL
ORDER BY X.employee_id;

/***************************************************************************************************
 * Approach 2 of 2: Using Subquery
 * Performance: Beats 10.87%
 ***************************************************************************************************/
SELECT employee_id FROM employees
WHERE salary < 30000 AND manager_id IS NOT NULL
  AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;


/*********************************************************************************************************************
 * Problem 38: 626. Exchange Seats
 * Difficulty: Medium
 * Key techniques: LAG/LEAD, Self Join
 * Best performance: 83.56%
 * URL: https://leetcode.com/problems/exchange-seats/
 * Description: Swap the seat IDs of every two consecutive students; if the total count is odd, the last student
 * keeps their seat.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using LAG(), LEAD() and Subquery
 * Performance: Beats 49%
 ***************************************************************************************************/
SELECT id,
  CASE
    WHEN id % 2 = 0 THEN prev_student
    WHEN id = total THEN student
    ELSE next_student
  END AS student
FROM (
  SELECT id, student,
    LAG(student) OVER (ORDER BY id) AS prev_student,
    LEAD(student) OVER (ORDER BY id) AS next_student,
    COUNT(*) OVER () AS total
  FROM Seat
) T
ORDER BY id;

/***************************************************************************************************
 * Approach 2 of 3: Simple
 * Performance: Beats 76.48%
 ***************************************************************************************************/
SELECT id,
  CASE WHEN id % 2 = 0 THEN LAG(student) OVER (ORDER BY id)
       WHEN id = (MAX(id) OVER ()) THEN student
       ELSE LEAD(student) OVER (ORDER BY id)
  END AS student
FROM seat
ORDER BY id;

/***************************************************************************************************
 * Approach 3 of 3: Using Self Join
 * Performance: Beats 83.56%
 ***************************************************************************************************/
SELECT s1.id,
  COALESCE(s2.student, s1.student) AS student
FROM Seat s1
LEFT JOIN Seat s2
  ON s2.id = s1.id + CASE WHEN s1.id % 2 = 1 THEN 1 ELSE -1 END
ORDER BY s1.id;


/*********************************************************************************************************************
 * Problem 39: 1341. Movie Rating
 * Difficulty: Medium
 * Key techniques: Subquery, CTE, UNION ALL
 * Best performance: 64.07%
 * URL: https://leetcode.com/problems/movie-rating/
 * Description: Find the user who rated the most movies and the movie with the highest average rating in a specific
 * month.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using Subqueries
 * Performance: Beats 21.62%
 ***************************************************************************************************/
(SELECT U.name AS results
FROM (
  SELECT user_id, COUNT(*) AS rate_count FROM movierating GROUP BY user_id
) MRO
JOIN users U ON MRO.user_id = U.user_id
ORDER BY rate_count DESC, U.name
LIMIT 1)

UNION ALL

(SELECT M.title AS results
FROM (
  SELECT movie_id, AVG(rating) AS avg_rat FROM movierating
  WHERE created_at >= '2020-02-01' AND created_at < '2020-03-01'
  GROUP BY movie_id
) MRT
JOIN movies M ON MRT.movie_id = M.movie_id
ORDER BY avg_rat DESC, M.title
LIMIT 1);

/***************************************************************************************************
 * Approach 2 of 3: Using CTEs
 * Performance: Beats 22.24%
 ***************************************************************************************************/
WITH user_ratings AS (
  SELECT U.name, COUNT(*) AS rate_count,
    RANK() OVER (ORDER BY COUNT(*) DESC, U.name) AS rnk
  FROM movierating MR
  JOIN users U ON MR.user_id = U.user_id
  GROUP BY U.name
),
movie_ratings AS (
  SELECT M.title, AVG(rating) AS avg_rat,
    RANK() OVER (ORDER BY AVG(rating) DESC, M.title) AS rnk
  FROM movierating MR
  JOIN movies M ON MR.movie_id = M.movie_id
  WHERE MR.created_at >= '2020-02-01' AND MR.created_at < '2020-03-01'
  GROUP BY M.title
)
SELECT name AS results FROM user_ratings WHERE rnk = 1
UNION ALL
SELECT title FROM movie_ratings WHERE rnk = 1;

/***************************************************************************************************
 * Approach 3 of 3: Using JOIN
 * Performance: Beats 64.07%
 ***************************************************************************************************/
(SELECT U.name AS results FROM users U
JOIN movierating MR ON U.user_id = MR.user_id
GROUP BY U.name
ORDER BY COUNT(MR.user_id) DESC, U.name
LIMIT 1)

UNION ALL

(SELECT M.title AS results FROM movies M
JOIN movierating MR ON M.movie_id = MR.movie_id
WHERE MR.created_at >= '2020-02-01' AND MR.created_at < '2020-03-01'
GROUP BY M.title
ORDER BY AVG(MR.rating) DESC, M.title
LIMIT 1);


/*********************************************************************************************************************
 * Problem 40: 1321. Restaurant Growth
 * Difficulty: Medium
 * Key techniques: CTE, Rolling Window
 * Best performance: 95.32%
 * URL: https://leetcode.com/problems/restaurant-growth/
 * Description: Compute the 7-day moving average of daily customer spending, only for days that have a full 7-day
 * window available.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using CTEs
 * Performance: Beats 49.16%
 ***************************************************************************************************/
WITH daily_tot AS (
  SELECT visited_on, SUM(amount) AS amount
  FROM Customer
  GROUP BY visited_on
),
rolling AS (
  SELECT visited_on,
    SUM(amount) OVER (ORDER BY visited_on
      RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount,
    ROUND(AVG(amount) OVER (ORDER BY visited_on
      RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW), 2) AS average_amount
  FROM daily_tot
)
SELECT * FROM rolling
WHERE visited_on >= (SELECT MIN(visited_on) + INTERVAL 6 DAY FROM daily_tot)
ORDER BY visited_on;

/***************************************************************************************************
 * Approach 2 of 2: Optimized
 * Performance: Beats 95.32%
 ***************************************************************************************************/
WITH daily_tot AS (
  SELECT visited_on, SUM(amount) AS amount
  FROM Customer
  GROUP BY visited_on
),
rolling AS (
  SELECT visited_on,
    SUM(amount) OVER (ORDER BY visited_on
      RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount
  FROM daily_tot
)
SELECT visited_on,
  amount,
  ROUND(amount / 7, 2) AS average_amount
FROM rolling
WHERE visited_on >= (SELECT MIN(visited_on) + INTERVAL 6 DAY FROM daily_tot)
ORDER BY visited_on;


/*********************************************************************************************************************
 * Problem 41: 602. Friend Requests II: Who Has the Most Friends
 * Difficulty: Medium
 * Key techniques: UNION ALL, COUNT
 * Best performance: 91.58%
 * URL: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
 * Description: Find the person with the most friends by combining both sides of accepted friend requests.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 * Performance: Beats 91.58%
 ***************************************************************************************************/
SELECT id, COUNT(*) AS num
FROM (
  SELECT requester_id AS id FROM requestaccepted
  UNION ALL
  SELECT accepter_id AS id FROM requestaccepted
) I
GROUP BY id
ORDER BY num DESC
LIMIT 1;


/*********************************************************************************************************************
 * Problem 42: 585. Investments in 2016
 * Difficulty: Medium
 * Key techniques: PARTITION BY, Subquery
 * Best performance: 98.70%
 * URL: https://leetcode.com/problems/investments-in-2016/
 * Description: Sum the 2016 investment values for policyholders who share a 2015 value with at least one other
 * policyholder but have a unique geographic location.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using PARTITION BY
 * Performance: Beats 27.39%
 ***************************************************************************************************/
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (
  SELECT tiv_2016,
    COUNT(*) OVER (PARTITION BY tiv_2015) AS f_one,
    COUNT(*) OVER (PARTITION BY lat, lon) AS f_two
  FROM insurance
) I
WHERE f_one > 1 AND f_two = 1;

/***************************************************************************************************
 * Approach 2 of 2: Using Subqueries
 * Performance: Beats 98.70%
 ***************************************************************************************************/
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM insurance
WHERE tiv_2015 IN (
  SELECT tiv_2015 FROM insurance GROUP BY tiv_2015 HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
  SELECT lat, lon FROM insurance GROUP BY lat, lon HAVING COUNT(*) = 1
);


/*********************************************************************************************************************
 * Problem 43: 185. Department Top Three Salaries
 * Difficulty: Hard
 * Key techniques: DENSE_RANK, PARTITION BY
 * Best performance: 82.98%
 * URL: https://leetcode.com/problems/department-top-three-salaries/
 * Description: Find employees who earn one of the top three distinct salaries within their department.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 * Performance: Beats 82.98%
 ***************************************************************************************************/
SELECT department, employee, salary
FROM (
  SELECT D.name AS department, E.name AS employee, E.salary,
    DENSE_RANK() OVER (PARTITION BY D.name ORDER BY E.salary DESC) AS rnk
  FROM department D
  JOIN employee E ON E.departmentid = D.id
) R
WHERE rnk < 4;


/*********************************************************************************************************************
 * Problem 44: 1667. Fix Names in a Table
 * Difficulty: Easy
 * Key techniques: CONCAT, UPPER/LOWER
 * Best performance: not listed
 * URL: https://leetcode.com/problems/fix-names-in-a-table/
 * Description: Correct the formatting of user names so only the first letter is uppercase and the rest are
 * lowercase.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using LEFT, SUBSTRING
 ***************************************************************************************************/
SELECT user_id,
  CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM users
ORDER BY user_id;

/***************************************************************************************************
 * Approach 2 of 2: Using LEFT, MID
 ***************************************************************************************************/
SELECT user_id,
  CONCAT(UPPER(LEFT(name, 1)), LOWER(MID(name, 2))) AS name
FROM users
ORDER BY user_id;


/*********************************************************************************************************************
 * Problem 45: 1527. Patients With a Condition
 * Difficulty: Easy
 * Key techniques: REGEXP, LIKE
 * Best performance: 80.91%
 * URL: https://leetcode.com/problems/patients-with-a-condition/
 * Description: Find patients who have been diagnosed with Type I Diabetes based on their conditions field.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using REGEXP
 * Performance: Beats 80.91%
 ***************************************************************************************************/
SELECT patient_id, patient_name, conditions
FROM patients
WHERE conditions REGEXP '(^| )DIAB1';

/***************************************************************************************************
 * Approach 2 of 2: Using LIKE
 * Performance: Beats 39.78%
 ***************************************************************************************************/
SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'
   OR conditions LIKE '% DIAB1%';


/*********************************************************************************************************************
 * Problem 46: 196. Delete Duplicate Emails
 * Difficulty: Easy
 * Key techniques: Self Join DELETE
 * Best performance: 70.86%
 * URL: https://leetcode.com/problems/delete-duplicate-emails/
 * Description: Delete all duplicate email entries from the table, keeping only the row with the smallest ID for
 * each email.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 * Performance: Beats 70.86%
 ***************************************************************************************************/
DELETE p1
FROM Person p1
JOIN Person p2
  ON p1.email = p2.email
  AND p1.id > p2.id;


/*********************************************************************************************************************
 * Problem 47: 176. Second Highest Salary
 * Difficulty: Medium
 * Key techniques: OFFSET, MAX, DENSE_RANK
 * Best performance: 83.95%
 * URL: https://leetcode.com/problems/second-highest-salary/
 * Description: Find the second highest distinct salary in the table, returning null if it does not exist.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 3: Using OFFSET
 * Performance: Beats 83.95%
 ***************************************************************************************************/
SELECT (
  SELECT DISTINCT salary FROM employee
  ORDER BY salary DESC
  LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

/***************************************************************************************************
 * Approach 2 of 3: Using MAX
 * Performance: Beats 74.84%
 ***************************************************************************************************/
SELECT (
  SELECT MAX(salary) FROM employee
  WHERE salary < (SELECT MAX(salary) FROM Employee)
) AS SecondHighestSalary;

/***************************************************************************************************
 * Approach 3 of 3: Using DENSE_RANK
 * Performance: Beats 49.38%
 ***************************************************************************************************/
SELECT (
  SELECT DISTINCT salary
  FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employee
  ) R
  WHERE rnk = 2
) AS SecondHighestSalary;


/*********************************************************************************************************************
 * Problem 48: 1484. Group Sold Products By The Date
 * Difficulty: Easy
 * Key techniques: GROUP_CONCAT
 * Best performance: not listed
 * URL: https://leetcode.com/problems/group-sold-products-by-the-date/
 * Description: For each selling date, report the number of distinct products sold and their names listed
 * alphabetically in a single comma-separated string.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 ***************************************************************************************************/
SELECT sell_date, COUNT(DISTINCT product) AS num_sold,
  GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM activities
GROUP BY sell_date
ORDER BY sell_date;


/*********************************************************************************************************************
 * Problem 49: 1327. List the Products Ordered in a Period
 * Difficulty: Easy
 * Key techniques: JOIN, pre-agg
 * Best performance: 76.36%
 * URL: https://leetcode.com/problems/list-the-products-ordered-in-a-period/
 * Description: Find products that had at least 100 units ordered in a specific month, along with the total units
 * ordered.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 2: Using JOIN
 * Performance: Beats 40.38%
 ***************************************************************************************************/
SELECT P.product_name, SUM(O.unit) AS unit
FROM products P
JOIN orders O ON P.product_id = O.product_id
WHERE LEFT(O.order_date, 7) = '2020-02'
GROUP BY P.product_name
HAVING unit >= 100;

/***************************************************************************************************
 * Approach 2 of 2: Pre-agg
 * Performance: Beats 76.36%
 ***************************************************************************************************/
SELECT P.product_name, O.unit
FROM Products P
JOIN (
  SELECT product_id, SUM(unit) AS unit
  FROM orders
  WHERE order_date >= '2020-02-01' AND order_date < '2020-03-01'
  GROUP BY product_id
  HAVING SUM(unit) >= 100
) O ON P.product_id = O.product_id;


/*********************************************************************************************************************
 * Problem 50: 1517. Find Users With Valid E-Mails
 * Difficulty: Easy
 * Key techniques: REGEXP
 * Best performance: 97.85%
 * URL: https://leetcode.com/problems/find-users-with-valid-e-mails/
 * Description: Find all users whose email address follows a valid format for a specific domain.
 *********************************************************************************************************************/

/***************************************************************************************************
 * Approach 1 of 1: Primary Solution
 * Performance: Beats 97.85%
 ***************************************************************************************************/
SELECT * FROM Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\.com$'
AND mail LIKE BINARY '%@leetcode.com';
