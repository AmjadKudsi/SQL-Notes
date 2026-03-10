# LeetCode SQL 50 — MySQL Solutions

## 📚 Index

| # | Problem | Difficulty | Key Technique(s) | Best Performance |
|---|---------|------------|------------------|-----------------|
| 1 | [Recyclable and Low Fat Products](#1757-recyclable-and-low-fat-products) | 🟢 Easy | `WHERE` filter | — |
| 2 | [Find Customer Referee](#584-find-customer-referee) | 🟢 Easy | `WHERE` + `IS NULL` | — |
| 3 | [Big Countries](#595-big-countries) | 🟢 Easy | `WHERE` + `OR` | — |
| 4 | [Article Views I](#1148-article-views-i) | 🟢 Easy | `DISTINCT`, self-compare | — |
| 5 | [Invalid Tweets](#1683-invalid-tweets) | 🟢 Easy | `LENGTH()` | — |
| 6 | [Replace Employee ID With The Unique Identifier](#1378-replace-employee-id-with-the-unique-identifier) | 🟢 Easy | `LEFT JOIN` | — |
| 7 | [Product Sales Analysis I](#1068-product-sales-analysis-i) | 🟢 Easy | `JOIN` | — |
| 8 | [Customer Who Visited but Did Not Make Any Transactions](#1581-customer-who-visited-but-did-not-make-any-transactions) | 🟢 Easy | `LEFT JOIN` + `IS NULL` | — |
| 9 | [Rising Temperature](#197-rising-temperature) | 🟢 Easy | `LAG`, Self Join, `EXISTS` | 98.38% |
| 10 | [Average Time of Process per Machine](#1661-average-time-of-process-per-machine) | 🟢 Easy | Conditional Agg, Self Join | 77.22% |
| 11 | [Employee Bonus](#577-employee-bonus) | 🟢 Easy | `LEFT JOIN`, `COALESCE` | — |
| 12 | [Students and Examinations](#1280-students-and-examinations) | 🟢 Easy | `CROSS JOIN`, `LEFT JOIN` | 85.65% |
| 13 | [Not Boring Movies](#620-not-boring-movies) | 🟢 Easy | `MOD`, Bitwise `&` | 81.48% |
| 14 | [Average Selling Price](#1251-average-selling-price) | 🟢 Easy | `LEFT JOIN`, `NULLIF`, pre-agg | 81.32% |
| 15 | [Managers with at Least 5 Direct Reports](#570-managers-with-at-least-5-direct-reports) | 🟡 Medium | `IN`, `JOIN` + `HAVING` | 93.51% |
| 16 | [Confirmation Rate](#1934-confirmation-rate) | 🟡 Medium | `AVG`, `IF`, pre-agg subquery | 82.92% |
| 17 | [Project Employees I](#1075-project-employees-i) | 🟢 Easy | `AVG`, `SUM`/`COUNT` | 85.58% |
| 18 | [Percentage of Users Attended a Contest](#1633-percentage-of-users-attended-a-contest) | 🟢 Easy | Scalar subquery, `CROSS JOIN` | 73.76% |
| 19 | [Queries Quality and Percentage](#1211-queries-quality-and-percentage) | 🟢 Easy | `AVG`, `SUM`, `CASE WHEN` | 96.29% |
| 20 | [Monthly Transactions I](#1193-monthly-transactions-i) | 🟡 Medium | `DATE_FORMAT`, `LEFT`, `CASE WHEN` | 87.21% |
| 21 | [Immediate Food Delivery II](#1174-immediate-food-delivery-ii) | 🟡 Medium | Subquery, `MIN` | 90.40% |
| 22 | [Game Play Analysis IV](#550-game-play-analysis-iv) | 🟡 Medium | `CTE`, Subquery, Window Function | 96.18% |
| 23 | [Number of Unique Subjects Taught by Each Teacher](#2356-number-of-unique-subjects-taught-by-each-teacher) | 🟢 Easy | `COUNT DISTINCT` | 90.92% |
| 24 | [User Activity for the Past 30 Days I](#1141-user-activity-for-the-past-30-days-i) | 🟢 Easy | `BETWEEN`, `COUNT DISTINCT` | 81.29% |
| 25 | [Product Sales Analysis III](#1070-product-sales-analysis-iii) | 🟡 Medium | `JOIN`, `RANK()`, Tuple `IN` | 84.71% |
| 26 | [Classes With at Least 5 Students](#596-classes-with-at-least-5-students) | 🟢 Easy | `HAVING`, `COUNT DISTINCT` | — |
| 27 | [Find Followers Count](#1729-find-followers-count) | 🟢 Easy | `COUNT`, `GROUP BY` | 86.10% |
| 28 | [Biggest Single Number](#619-biggest-single-number) | 🟢 Easy | Subquery, `MAX`, `HAVING` | 81.94% |
| 29 | [Customers Who Bought All Products](#1045-customers-who-bought-all-products) | 🟡 Medium | `HAVING`, `COUNT DISTINCT` | 75.88% |
| 30 | [The Number of Employees Which Report to Each Employee](#1731-the-number-of-employees-which-report-to-each-employee) | 🟢 Easy | Self Join, Subquery | 62.73% |
| 31 | [Primary Department for Each Employee](#1789-primary-department-for-each-employee) | 🟢 Easy | `UNION ALL`, `PARTITION BY` | 70.77% |
| 32 | [Triangle Judgement](#610-triangle-judgement) | 🟢 Easy | `CASE WHEN` | 86.78% |
| 33 | [Consecutive Numbers](#180-consecutive-numbers) | 🟡 Medium | `LAG`/`LEAD`, Self Join | 77.29% |
| 34 | [Product Price at a Given Date](#1164-product-price-at-a-given-date) | 🟡 Medium | Subquery, `UNION`, `CTE` | 63.65% |
| 35 | [Last Person to Fit in the Bus](#1204-last-person-to-fit-in-the-bus) | 🟡 Medium | Running sum, `CTE`, Variables | 64.79% |
| 36 | [Count Salary Categories](#1907-count-salary-categories) | 🟡 Medium | `UNION ALL`, `CTE` | 96.78% |
| 37 | [Employees Whose Manager Left the Company](#1978-employees-whose-manager-left-the-company) | 🟢 Easy | `LEFT JOIN`, Subquery | 82.67% |
| 38 | [Exchange Seats](#626-exchange-seats) | 🟡 Medium | `LAG`/`LEAD`, Self Join | 83.56% |
| 39 | [Movie Rating](#1341-movie-rating) | 🟡 Medium | Subquery, `CTE`, `UNION ALL` | 64.07% |
| 40 | [Restaurant Growth](#1321-restaurant-growth) | 🟡 Medium | `CTE`, Rolling Window | 95.32% |
| 41 | [Friend Requests II: Who Has the Most Friends](#602-friend-requests-ii-who-has-the-most-friends) | 🟡 Medium | `UNION ALL`, `COUNT` | 91.58% |
| 42 | [Investments in 2016](#585-investments-in-2016) | 🟡 Medium | `PARTITION BY`, Subquery | 98.70% |
| 43 | [Department Top Three Salaries](#185-department-top-three-salaries) | 🔴 Hard | `DENSE_RANK`, `PARTITION BY` | 82.98% |
| 44 | [Fix Names in a Table](#1667-fix-names-in-a-table) | 🟢 Easy | `CONCAT`, `UPPER`/`LOWER` | — |
| 45 | [Patients With a Condition](#1527-patients-with-a-condition) | 🟢 Easy | `REGEXP`, `LIKE` | 80.91% |
| 46 | [Delete Duplicate Emails](#196-delete-duplicate-emails) | 🟢 Easy | Self Join `DELETE` | 70.86% |
| 47 | [Second Highest Salary](#176-second-highest-salary) | 🟡 Medium | `OFFSET`, `MAX`, `DENSE_RANK` | 83.95% |
| 48 | [Group Sold Products By The Date](#1484-group-sold-products-by-the-date) | 🟢 Easy | `GROUP_CONCAT` | — |
| 49 | [List the Products Ordered in a Period](#1327-list-the-products-ordered-in-a-period) | 🟢 Easy | `JOIN`, pre-agg | 76.36% |
| 50 | [Find Users With Valid E-Mails](#1517-find-users-with-valid-e-mails) | 🟢 Easy | `REGEXP` | 97.85% |

> 💡 **Reading the table:** Each problem links directly to its solution below. Where multiple approaches are provided, the *Best Performance* column shows the top `🎯 Beats` score achieved.

---

### [1757. Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/)


> Find all products that are both low fat and recyclable.
```sql
SELECT product_id FROM products WHERE low_fats = 'Y' AND recyclable = 'Y';
```

---

### [584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/)


> Find all customers who were not referred by a specific customer.
```sql
SELECT name FROM customer WHERE referee_id != 2 OR referee_id IS NULL;
```

---

### [595. Big Countries](https://leetcode.com/problems/big-countries/)


> Find all countries that are either very large in area or have a very large population.
```sql
SELECT name, population, area FROM world WHERE area >= 3000000 OR population >= 25000000;
```

---

### [1148. Article Views I](https://leetcode.com/problems/article-views-i/)


> Find all authors who have viewed at least one of their own articles.
```sql
SELECT DISTINCT author_id AS id FROM views WHERE author_id = viewer_id ORDER BY author_id;
```

---

### [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/)


> Find all tweets whose content exceeds the allowed character length.
```sql
SELECT tweet_id FROM tweets WHERE LENGTH(content) > 15;
```

---

### [1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/)


> Display each employee's unique identifier alongside their name, showing null if no mapping exists.
```sql
SELECT U.unique_id, E.name FROM employees E LEFT JOIN employeeuni U ON E.id = U.id;
```

---

### [1068. Product Sales Analysis I](https://leetcode.com/problems/product-sales-analysis-i/)


> Report the product name, year, and price for every entry in the sales table.
```sql
SELECT P.product_name, S.year, S.price FROM sales S JOIN product P ON S.product_id = P.product_id;
```

---

### [1581. Customer Who Visited but Did Not Make Any Transactions](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/)


> Find customers who visited but made no transactions, along with how many times that occurred.
```sql
SELECT V.customer_id, COUNT(*) AS count_no_trans
FROM Visits V
LEFT JOIN Transactions T
  ON V.visit_id = T.visit_id
WHERE T.visit_id IS NULL
GROUP BY V.customer_id;
```

---

### [197. Rising Temperature](https://leetcode.com/problems/rising-temperature/)


> Find all dates where the temperature was higher than the previous day's temperature.
**Using LAG**
```sql
SELECT id
FROM (
  SELECT id, recordDate, temperature,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
    LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
  FROM weather
) w
WHERE prev_date = recordDate - INTERVAL '1' DAY
  AND temperature > prev_temp;
```
> 🎯 **Beats:** 39.26%

**Using Self Join**
```sql
SELECT w1.id
FROM weather w1
JOIN weather w2
  ON w2.recordDate = w1.recordDate - INTERVAL '1' DAY
WHERE w1.temperature > w2.temperature;
```
> 🎯 **Beats:** 79.80%

**Using Correlated Subquery**
```sql
SELECT id FROM weather w1
WHERE w1.temperature > (
  SELECT w2.temperature FROM weather w2
  WHERE w2.recordDate = w1.recordDate - INTERVAL '1' DAY
);
```
> 🎯 **Beats:** 86.73%

**Using EXISTS**
```sql
SELECT w1.id
FROM Weather w1
WHERE EXISTS (
  SELECT 1
  FROM Weather w2
  WHERE w2.recordDate = w1.recordDate - INTERVAL '1' DAY
    AND w1.temperature > w2.temperature
);
```
> 🎯 **Beats:** 93.08%

**Using Window Function with DATE_DIFF**
```sql
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
```
> 🎯 **Beats:** 98.38%

---

### [1661. Average Time of Process per Machine](https://leetcode.com/problems/average-time-of-process-per-machine/)


> Calculate the average time each machine takes to complete a process across all its process runs.
**Using Conditional Aggregation in Subquery**
```sql
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
```
> 🎯 **Beats:** 63.83%

**Using Correlated Subquery**
```sql
SELECT machine_id, ROUND(AVG((SELECT a2.timestamp FROM activity a2
  WHERE a2.machine_id = a1.machine_id
    AND a2.process_id = a1.process_id
    AND a2.activity_type = 'end') - a1.timestamp), 3) AS processing_time
FROM activity a1
WHERE a1.activity_type = 'start'
GROUP BY machine_id;
```
> 🎯 **Beats:** 68.33%

**Using Self Join**
```sql
SELECT s.machine_id, ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM activity s
JOIN activity e
  ON s.machine_id = e.machine_id
  AND s.process_id = e.process_id
  AND e.activity_type = 'end'
WHERE s.activity_type = 'start'
GROUP BY s.machine_id;
```
> 🎯 **Beats:** 77.22%

---

### [577. Employee Bonus](https://leetcode.com/problems/employee-bonus/)


> Report the name and bonus of each employee whose bonus is less than 1000 or who has no bonus at all.
**Simple**
```sql
SELECT e.name, b.bonus FROM employee e LEFT JOIN bonus b ON e.empId = b.empId
WHERE bonus < 1000 OR bonus IS NULL;
```

**Using COALESCE**
```sql
SELECT e.name, b.bonus FROM employee e LEFT JOIN bonus b ON e.empId = b.empId
WHERE COALESCE(b.bonus, 0) < 1000;
```

---

### [1280. Students and Examinations](https://leetcode.com/problems/students-and-examinations/)


> For every student and every subject, report how many times that student attended an exam for that subject.
**Using CROSS JOIN**
```sql
SELECT st.student_id, st.student_name, su.subject_name, COUNT(e.subject_name) AS attended_exams
FROM students st CROSS JOIN subjects su LEFT JOIN examinations e
    ON st.student_id = e.student_id AND e.subject_name = su.subject_name
GROUP BY st.student_id, st.student_name, su.subject_name
ORDER BY st.student_id, st.student_name;
```
> 🎯 **Beats:** 52.62%

**Using LEFT JOIN**
```sql
SELECT S.student_id, S.student_name, Su.subject_name, COUNT(E.student_id) AS attended_exams
FROM students S
JOIN subjects Su
LEFT JOIN examinations E
  ON S.student_id = E.student_id
  AND Su.subject_name = E.subject_name
GROUP BY S.student_id, Su.subject_name
ORDER BY student_id, subject_name;
```
> 🎯 **Beats:** 85.65%

---

### [620. Not Boring Movies](https://leetcode.com/problems/not-boring-movies/)


> Find movies with an odd-numbered ID and a description that is not "boring", sorted by rating descending.
**Using MOD (%)**
```sql
SELECT id, movie, description, rating FROM cinema
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC;
```
> 🎯 **Beats:** 79.67%

**Using Bitwise AND (&)**
```sql
SELECT id, movie, description, rating FROM cinema
WHERE id & 1 = 1 AND description <> 'boring'
ORDER BY rating DESC;
```
> 🎯 **Beats:** 81.48%

---

### [1251. Average Selling Price](https://leetcode.com/problems/average-selling-price/)


> Calculate the average selling price for each product weighted by the number of units sold.
**JOIN first, AGG later**
```sql
SELECT P.product_id,
  ROUND(COALESCE(SUM(P.price * U.units) / NULLIF(SUM(U.units), 0), 0), 2) AS average_price
FROM prices P
LEFT JOIN unitssold U
  ON P.product_id = U.product_id
  AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id;
```
> 🎯 **Beats:** 35.36%

**AGG first, JOIN later**
```sql
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
```
> 🎯 **Beats:** 81.32%

---

### [570. Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/)


> Find managers who have at least five employees reporting directly to them.
**Using IN**
```sql
SELECT e.name FROM employee e
WHERE e.id IN (SELECT managerId FROM employee
                WHERE managerId IS NOT NULL
                GROUP BY managerId
                HAVING COUNT(*) > 4);
```
> 🎯 **Beats:** 91.05%

**Using JOIN**
```sql
SELECT e.name FROM employee e
JOIN (
  SELECT managerId FROM employee
  WHERE managerId IS NOT NULL
  GROUP BY managerId
  HAVING COUNT(*) > 4
) m ON e.id = m.managerId;
```
> 🎯 **Beats:** 93.51%

---

### [1934. Confirmation Rate](https://leetcode.com/problems/confirmation-rate/)


> Calculate the rate at which each user confirmed their messages out of all messages sent to them.
**Using COALESCE**
```sql
SELECT S.user_id,
  ROUND(COALESCE(AVG(C.action = 'confirmed'), 0), 2) AS confirmation_rate
FROM signups S
LEFT JOIN confirmations C ON S.user_id = C.user_id
GROUP BY user_id;
```
> 🎯 **Beats:** 39.9%

**Using IF**
```sql
SELECT S.user_id,
  ROUND(AVG(IF(c.action = 'confirmed', 1, 0)), 2) AS confirmation_rate
FROM signups S
LEFT JOIN confirmations C ON S.user_id = C.user_id
GROUP BY user_id;
```
> 🎯 **Beats:** 64.95%

**AGG first, JOIN later**
```sql
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
```
> 🎯 **Beats:** 82.92%

---

### [1075. Project Employees I](https://leetcode.com/problems/project-employees-i/)


> Find the average years of experience of employees assigned to each project.
**Using AVG**
```sql
SELECT project_id, ROUND(AVG(E.experience_years), 2) AS average_years
FROM project P JOIN employee E ON P.employee_id = E.employee_id
GROUP BY project_id;
```
> 🎯 **Beats:** 70.76%

**Using SUM / COUNT**
```sql
SELECT project_id, ROUND(SUM(E.experience_years)/COUNT(*), 2) AS average_years
FROM project P JOIN employee E ON P.employee_id = E.employee_id
GROUP BY project_id;
```
> 🎯 **Beats:** 85.58%

---

### [1633. Percentage of Users Attended a Contest](https://leetcode.com/problems/percentage-of-users-attended-a-contest/)


> Calculate the percentage of all users who registered for each contest, sorted by percentage then contest ID.
**Using Scalar Subquery**
```sql
SELECT contest_id,
    ROUND((COUNT(user_id)/(SELECT COUNT(*) FROM users)) * 100, 2) AS percentage
FROM register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;
```
> 🎯 **Beats:** 73.76%

**Using CROSS JOIN**
```sql
SELECT contest_id,
    ROUND((COUNT(R.user_id)/ U.total) * 100, 2) AS percentage
FROM register R
CROSS JOIN (SELECT COUNT(*) AS total FROM users) U
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;
```
> 🎯 **Beats:** 73.23%

---

### [1211. Queries Quality and Percentage](https://leetcode.com/problems/queries-quality-and-percentage/)


> For each query, calculate its average quality rating and the percentage of its results rated as poor.
**Using SUM**
```sql
SELECT query_name,
    ROUND(AVG(rating/position), 2) AS quality,
    ROUND(SUM(rating < 3)*100/COUNT(rating), 2) AS poor_query_percentage
FROM queries
GROUP BY query_name;
```
> 🎯 **Beats:** 42.94%

**Using CASE WHEN**
```sql
SELECT query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100, 2) AS poor_query_percentage
FROM queries
WHERE query_name IS NOT NULL
GROUP BY query_name;
```
> 🎯 **Beats:** 96.29%

---

### [1193. Monthly Transactions I](https://leetcode.com/problems/monthly-transactions-i/)


> For each month and country, summarize the total number of transactions and the count and amount of approved ones.
**Using DATE_FORMAT**
```sql
SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month, country,
    COUNT(trans_date) AS trans_count,
    SUM(state='approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY month, country;
```
> 🎯 **Beats:** 39.53%

**Using LEFT**
```sql
SELECT LEFT(trans_date, 7) AS month, country,
    COUNT(trans_date) AS trans_count,
    SUM(state='approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY month, country;
```
> 🎯 **Beats:** 78.97%

**Using CASE WHEN x2**
```sql
SELECT LEFT(trans_date, 7) AS month, country,
    COUNT(trans_date) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM transactions
GROUP BY month, country;
```
> 🎯 **Beats:** 87.21%

---

### [1174. Immediate Food Delivery II](https://leetcode.com/problems/immediate-food-delivery-ii/)


> Find the percentage of customers whose first-ever order was an immediate delivery.
```sql
SELECT ROUND(SUM(first_order = first_del) * 100 / COUNT(*), 2) AS immediate_percentage
FROM (
  SELECT customer_id, MIN(order_date) AS first_order,
    MIN(customer_pref_delivery_date) AS first_del
  FROM delivery
  GROUP BY customer_id
) f;
```
> 🎯 **Beats:** 90.67%

---

### [550. Game Play Analysis IV](https://leetcode.com/problems/game-play-analysis-iv/)


> Find the fraction of players who logged in again the day immediately after their first login.
**Using CTE**
```sql
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
```
> 🎯 **Beats:** 18.92%

**Using Subquery**
```sql
SELECT ROUND(COUNT(A.player_id) / COUNT(F.player_id), 2) AS fraction
FROM (
  SELECT player_id, MIN(event_date) AS first_date
  FROM activity
  GROUP BY player_id
) F
LEFT JOIN activity A
  ON F.player_id = A.player_id
  AND A.event_date = DATE_ADD(F.first_date, INTERVAL 1 DAY);
```
> 🎯 **Beats:** 82.32%

**Using Window Function**
```sql
SELECT ROUND(
  SUM(CASE WHEN DATEDIFF(event_date, first_date) = 1 THEN 1 ELSE 0 END) /
  COUNT(DISTINCT player_id), 2
) AS fraction
FROM (
  SELECT player_id, event_date,
    MIN(event_date) OVER (PARTITION BY player_id) AS first_date
  FROM Activity
) T;
```
> 🎯 **Beats:** 96.18%

---

### [2356. Number of Unique Subjects Taught by Each Teacher](https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/)


> Count how many distinct subjects each teacher teaches across all departments.
```sql
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id;
```
> 🎯 **Beats:** 91.25%

---

### [1141. User Activity for the Past 30 Days I](https://leetcode.com/problems/user-activity-for-the-past-30-days-i/)


> Count the number of active users per day within a specific 30-day window.
**Using BETWEEN**
```sql
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;
```
> 🎯 **Beats:** 60.32%

**Using Subquery**
```sql
SELECT activity_date AS day, COUNT(user_id) AS active_users
FROM (
  SELECT DISTINCT activity_date, user_id
  FROM activity
  WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
) A
GROUP BY activity_date;
```
> 🎯 **Beats:** 57.18%

**Using Direct Range Operators**
```sql
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE activity_date > '2019-06-27' AND activity_date <= '2019-07-27'
GROUP BY activity_date;
```
> 🎯 **Beats:** 81.29%

---

### [1070. Product Sales Analysis III](https://leetcode.com/problems/product-sales-analysis-iii/)


> For each product, report the first year it was ever sold along with the quantity and price that year.
**Using JOIN**
```sql
SELECT S.product_id, S.year AS first_year, S.quantity, S.price
FROM sales S
JOIN (
  SELECT product_id, MIN(year) AS first_year FROM sales
  GROUP BY product_id
) F ON S.product_id = F.product_id AND S.year = F.first_year;
```
> 🎯 **Beats:** 18.85%

**Using RANK()**
```sql
SELECT product_id, year AS first_year, quantity, price
FROM (
  SELECT product_id, year, quantity, price,
    RANK() OVER (PARTITION BY product_id ORDER BY year) AS rnk
  FROM sales
) R
WHERE rnk = 1;
```
> 🎯 **Beats:** 44.65%

**Using Tuple IN**
```sql
SELECT product_id, year AS first_year, quantity, price
FROM sales
WHERE (product_id, year) IN (
  SELECT product_id, MIN(year) FROM sales
  GROUP BY product_id
);
```
> 🎯 **Beats:** 84.71%

---

### [596. Classes With at Least 5 Students](https://leetcode.com/problems/classes-more-than-5-students/)


> Find all classes that have at least five students enrolled.
**Using DISTINCT**
```sql
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
```

**Simple**
```sql
SELECT class
FROM courses
GROUP BY 1
HAVING COUNT(DISTINCT student) > 4;
```

---

### [1729. Find Followers Count](https://leetcode.com/problems/find-followers-count/)


> Report the number of followers each user has, sorted by user ID.
```sql
SELECT user_id, COUNT(follower_id) AS followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id;
```
> 🎯 **Beats:** 86.10%

---

### [619. Biggest Single Number](https://leetcode.com/problems/biggest-single-number/)


> Find the largest number that appears exactly once in the table, or null if no such number exists.
```sql
SELECT MAX(num) AS num
FROM (
  SELECT num FROM mynumbers
  GROUP BY num
  HAVING COUNT(*) = 1
) N;
```
> 🎯 **Beats:** 81.94%

---

### [1045. Customers Who Bought All Products](https://leetcode.com/problems/customers-who-bought-all-products/)


> Find all customers who have purchased every single product in the product table.
```sql
SELECT customer_id FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM product);
```
> 🎯 **Beats:** 75.88%

---

### [1731. The Number of Employees Which Report to Each Employee](https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/)


> For each manager, report the number of direct reports and the average age of those reports rounded to the nearest integer.
**Subquery Aggregates First, Then Join**
```sql
SELECT E.employee_id, E.name, M.reports_count, M.average_age
FROM employees E
JOIN (
  SELECT reports_to, COUNT(*) AS reports_count, ROUND(AVG(age)) AS average_age
  FROM employees
  WHERE reports_to IS NOT NULL
  GROUP BY reports_to
) M ON E.employee_id = M.reports_to
ORDER BY E.employee_id;
```
> 🎯 **Beats:** 44.82%

**Direct Join, Aggregates After**
```sql
SELECT M.employee_id, M.name, COUNT(*) AS reports_count, ROUND(AVG(E.age)) AS average_age
FROM Employees M
JOIN Employees E ON E.reports_to = M.employee_id
GROUP BY M.employee_id
ORDER BY M.employee_id;
```
> 🎯 **Beats:** 62.73%

---

### [1789. Primary Department for Each Employee](https://leetcode.com/problems/primary-department-for-each-employee/)


> Find the primary department for each employee — the single department if they only belong to one, or the one flagged as primary.
**Using UNION ALL**
```sql
SELECT employee_id, department_id FROM employee
GROUP BY employee_id
HAVING COUNT(*) = 1

UNION ALL

SELECT employee_id, department_id FROM employee
WHERE primary_flag = 'Y';
```
> 🎯 **Beats:** 46.54%

**Using PARTITION BY**
```sql
SELECT employee_id, department_id
FROM (
  SELECT employee_id, department_id, primary_flag,
    COUNT(*) OVER (PARTITION BY employee_id) AS dept_count
  FROM employee
) E
WHERE primary_flag = 'Y' OR dept_count = 1;
```
> 🎯 **Beats:** 63.04%

**Simple**
```sql
SELECT employee_id, department_id FROM employee
WHERE primary_flag = 'Y'
OR employee_id IN (
  SELECT employee_id FROM employee
  GROUP BY employee_id
  HAVING COUNT(*) = 1
);
```
> 🎯 **Beats:** 70.77%

---

### [610. Triangle Judgement](https://leetcode.com/problems/triangle-judgement/)


> For each row of three side lengths, determine whether they can form a valid triangle.
```sql
SELECT x, y, z,
  CASE WHEN x+y > z AND y+z > x AND x+z > y THEN 'Yes' ELSE 'No' END AS triangle
FROM triangle;
```
> 🎯 **Beats:** 86.78%

---

### [180. Consecutive Numbers](https://leetcode.com/problems/consecutive-numbers/)


> Find all numbers that appear at least three times consecutively in the table.
**Using LAG() and LEAD()**
```sql
SELECT DISTINCT num AS ConsecutiveNums
FROM (
  SELECT num,
    LAG(num) OVER (ORDER BY id) AS prev,
    LEAD(num) OVER (ORDER BY id) AS next
  FROM logs
) N
WHERE N.num = N.prev AND N.num = N.next;
```
> 🎯 **Beats:** 20.76%

**Simple Self Join**
```sql
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM logs l1
JOIN logs l2 ON l2.id = l1.id + 1 AND l2.num = l1.num
JOIN logs l3 ON l3.id = l1.id + 2 AND l3.num = l1.num;
```
> 🎯 **Beats:** 77.29%

---

### [1164. Product Price at a Given Date](https://leetcode.com/problems/product-price-at-a-given-date/)


> Find the price of each product on a specific date, defaulting to 10 if no price change had occurred before that date.
**Using Subquery**
```sql
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
```
> 🎯 **Beats:** 63.65%

**Using UNION**
```sql
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
```
> 🎯 **Beats:** 54.30%

**Using CTE**
```sql
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
```
> 🎯 **Beats:** 46.53%

---

### [1204. Last Person to Fit in the Bus](https://leetcode.com/problems/last-person-to-fit-in-the-bus/)


> Find the name of the last person who can board the bus without the total weight exceeding the limit.
**Using Subquery**
```sql
SELECT person_name
FROM (
  SELECT person_name, turn,
    SUM(weight) OVER (ORDER BY turn) AS running_weight
  FROM queue
) q
WHERE running_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
```
> 🎯 **Beats:** 64.79%

**Using CTE**
```sql
WITH W AS (
  SELECT *,
    SUM(weight) OVER (ORDER BY turn) AS running_weight
  FROM queue
)
SELECT person_name FROM W
WHERE running_weight < 1001
ORDER BY turn DESC
LIMIT 1;
```
> 🎯 **Beats:** 48.92%

**Using MySQL Variables**
```sql
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
```
> 🎯 **Beats:** 63.08%

**Using JOIN**
```sql
SELECT q1.person_name
FROM queue q1
JOIN queue q2 ON q2.turn <= q1.turn
GROUP BY q1.turn, q1.person_name
HAVING SUM(q2.weight) <= 1000
ORDER BY q1.turn DESC
LIMIT 1;
```
> 🎯 **Beats:** 7.90%

---

### [1907. Count Salary Categories](https://leetcode.com/problems/count-salary-categories/)


> Count how many employees fall into each of three salary categories: low, average, and high.
**Using UNION ALL**
```sql
SELECT 'High Salary' AS category, SUM(income > 50000) AS accounts_count FROM accounts
UNION ALL
SELECT 'Average Salary', SUM(income >= 20000 AND income <= 50000) FROM accounts
UNION ALL
SELECT 'Low Salary', SUM(income < 20000) FROM accounts;
```
> 🎯 **Beats:** 34.88%

**Using CTE**
```sql
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
```
> 🎯 **Beats:** 96.78%

---

### [1978. Employees Whose Manager Left the Company](https://leetcode.com/problems/employees-whose-manager-left-the-company/)


> Find employees with a low salary whose manager no longer exists in the company.
**Using LEFT JOIN**
```sql
SELECT X.employee_id FROM employees X
LEFT JOIN employees Y ON X.manager_id = Y.employee_id
WHERE X.salary < 30000 AND X.manager_id IS NOT NULL AND Y.employee_id IS NULL
ORDER BY X.employee_id;
```
> 🎯 **Beats:** 82.67%

**Using Subquery**
```sql
SELECT employee_id FROM employees
WHERE salary < 30000 AND manager_id IS NOT NULL
  AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;
```
> 🎯 **Beats:** 10.87%

---

### [626. Exchange Seats](https://leetcode.com/problems/exchange-seats/)


> Swap the seat IDs of every two consecutive students; if the total count is odd, the last student keeps their seat.
**Using LAG(), LEAD() and Subquery**
```sql
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
```
> 🎯 **Beats:** 49%

**Simple**
```sql
SELECT id,
  CASE WHEN id % 2 = 0 THEN LAG(student) OVER (ORDER BY id)
       WHEN id = (MAX(id) OVER ()) THEN student
       ELSE LEAD(student) OVER (ORDER BY id)
  END AS student
FROM seat
ORDER BY id;
```
> 🎯 **Beats:** 76.48%

**Using Self Join**
```sql
SELECT s1.id,
  COALESCE(s2.student, s1.student) AS student
FROM Seat s1
LEFT JOIN Seat s2
  ON s2.id = s1.id + CASE WHEN s1.id % 2 = 1 THEN 1 ELSE -1 END
ORDER BY s1.id;
```
> 🎯 **Beats:** 83.56%

---

### [1341. Movie Rating](https://leetcode.com/problems/movie-rating/)


> Find the user who rated the most movies and the movie with the highest average rating in a specific month.
**Using Subqueries**
```sql
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
```
> 🎯 **Beats:** 21.62%

**Using CTEs**
```sql
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
```
> 🎯 **Beats:** 22.24%

**Using JOIN**
```sql
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
```
> 🎯 **Beats:** 64.07%

---

### [1321. Restaurant Growth](https://leetcode.com/problems/restaurant-growth/)


> Compute the 7-day moving average of daily customer spending, only for days that have a full 7-day window available.
**Using CTEs**
```sql
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
```
> 🎯 **Beats:** 49.16%

**Optimized**
```sql
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
```
> 🎯 **Beats:** 95.32%

---

### [602. Friend Requests II: Who Has the Most Friends](https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/)


> Find the person with the most friends by combining both sides of accepted friend requests.
```sql
SELECT id, COUNT(*) AS num
FROM (
  SELECT requester_id AS id FROM requestaccepted
  UNION ALL
  SELECT accepter_id AS id FROM requestaccepted
) I
GROUP BY id
ORDER BY num DESC
LIMIT 1;
```
> 🎯 **Beats:** 91.58%

---

### [585. Investments in 2016](https://leetcode.com/problems/investments-in-2016/)


> Sum the 2016 investment values for policyholders who share a 2015 value with at least one other policyholder but have a unique geographic location.
**Using PARTITION BY**
```sql
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (
  SELECT tiv_2016,
    COUNT(*) OVER (PARTITION BY tiv_2015) AS f_one,
    COUNT(*) OVER (PARTITION BY lat, lon) AS f_two
  FROM insurance
) I
WHERE f_one > 1 AND f_two = 1;
```
> 🎯 **Beats:** 27.39%

**Using Subqueries**
```sql
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM insurance
WHERE tiv_2015 IN (
  SELECT tiv_2015 FROM insurance GROUP BY tiv_2015 HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
  SELECT lat, lon FROM insurance GROUP BY lat, lon HAVING COUNT(*) = 1
);
```
> 🎯 **Beats:** 98.70%

---

### [185. Department Top Three Salaries](https://leetcode.com/problems/department-top-three-salaries/)


> Find employees who earn one of the top three distinct salaries within their department.
```sql
SELECT department, employee, salary
FROM (
  SELECT D.name AS department, E.name AS employee, E.salary,
    DENSE_RANK() OVER (PARTITION BY D.name ORDER BY E.salary DESC) AS rnk
  FROM department D
  JOIN employee E ON E.departmentid = D.id
) R
WHERE rnk < 4;
```
> 🎯 **Beats:** 82.98%

---

### [1667. Fix Names in a Table](https://leetcode.com/problems/fix-names-in-a-table/)


> Correct the formatting of user names so only the first letter is uppercase and the rest are lowercase.
**Using LEFT, SUBSTRING**
```sql
SELECT user_id,
  CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM users
ORDER BY user_id;
```

**Using LEFT, MID**
```sql
SELECT user_id,
  CONCAT(UPPER(LEFT(name, 1)), LOWER(MID(name, 2))) AS name
FROM users
ORDER BY user_id;
```

---

### [1527. Patients With a Condition](https://leetcode.com/problems/patients-with-a-condition/)


> Find patients who have been diagnosed with Type I Diabetes based on their conditions field.
**Using REGEXP**
```sql
SELECT patient_id, patient_name, conditions
FROM patients
WHERE conditions REGEXP '(^| )DIAB1';
```
> 🎯 **Beats:** 80.91%

**Using LIKE**
```sql
SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'
   OR conditions LIKE '% DIAB1%';
```
> 🎯 **Beats:** 39.78%

---

### [196. Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/)


> Delete all duplicate email entries from the table, keeping only the row with the smallest ID for each email.
```sql
DELETE p1
FROM Person p1
JOIN Person p2
  ON p1.email = p2.email
  AND p1.id > p2.id;
```
> 🎯 **Beats:** 70.86%

---

### [176. Second Highest Salary](https://leetcode.com/problems/second-highest-salary/)


> Find the second highest distinct salary in the table, returning null if it does not exist.
**Using OFFSET**
```sql
SELECT (
  SELECT DISTINCT salary FROM employee
  ORDER BY salary DESC
  LIMIT 1 OFFSET 1
) AS SecondHighestSalary;
```
> 🎯 **Beats:** 83.95%

**Using MAX**
```sql
SELECT (
  SELECT MAX(salary) FROM employee
  WHERE salary < (SELECT MAX(salary) FROM Employee)
) AS SecondHighestSalary;
```
> 🎯 **Beats:** 74.84%

**Using DENSE_RANK**
```sql
SELECT (
  SELECT DISTINCT salary
  FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employee
  ) R
  WHERE rnk = 2
) AS SecondHighestSalary;
```
> 🎯 **Beats:** 49.38%

---

### [1484. Group Sold Products By The Date](https://leetcode.com/problems/group-sold-products-by-the-date/)


> For each selling date, report the number of distinct products sold and their names listed alphabetically in a single comma-separated string.
```sql
SELECT sell_date, COUNT(DISTINCT product) AS num_sold,
  GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM activities
GROUP BY sell_date
ORDER BY sell_date;
```

---

### [1327. List the Products Ordered in a Period](https://leetcode.com/problems/list-the-products-ordered-in-a-period/)


> Find products that had at least 100 units ordered in a specific month, along with the total units ordered.
**Using JOIN**
```sql
SELECT P.product_name, SUM(O.unit) AS unit
FROM products P
JOIN orders O ON P.product_id = O.product_id
WHERE LEFT(O.order_date, 7) = '2020-02'
GROUP BY P.product_name
HAVING unit >= 100;
```
> 🎯 **Beats:** 40.38%

**Pre-agg**
```sql
SELECT P.product_name, O.unit
FROM Products P
JOIN (
  SELECT product_id, SUM(unit) AS unit
  FROM orders
  WHERE order_date >= '2020-02-01' AND order_date < '2020-03-01'
  GROUP BY product_id
  HAVING SUM(unit) >= 100
) O ON P.product_id = O.product_id;
```
> 🎯 **Beats:** 76.36%

---

### [1517. Find Users With Valid E-Mails](https://leetcode.com/problems/find-users-with-valid-e-mails/)


> Find all users whose email address follows a valid format for a specific domain.
```sql
SELECT * FROM Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\.com$'
AND mail LIKE BINARY '%@leetcode.com';
```
> 🎯 **Beats:** 97.85%
