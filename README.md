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
| 21 | [Immediate Food Delivery II](#1174-immediate-food-delivery-ii) | 🟡 Medium | Subquery, `MIN` | 90.67% |
| 22 | [Game Play Analysis IV](#550-game-play-analysis-iv) | 🟡 Medium | `CTE`, Subquery, Window Function | 96.18% |
| 23 | [Number of Unique Subjects Taught by Each Teacher](#2356-number-of-unique-subjects-taught-by-each-teacher) | 🟢 Easy | `COUNT DISTINCT` | 91.25% |
| 24 | [User Activity for the Past 30 Days I](#1141-user-activity-for-the-past-30-days-i) | 🟢 Easy | `BETWEEN`, `COUNT DISTINCT` | 81.29% |
| 25 | [Product Sales Analysis III](#1070-product-sales-analysis-iii) | 🟡 Medium | `JOIN`, `RANK()`, Tuple `IN` | 84.71% |
| 26 | [Classes With at Least 5 Students](#596-classes-with-at-least-5-students) | 🟢 Easy | `HAVING`, `COUNT DISTINCT` | — |
| 27 | [Find Followers Count](#1729-find-followers-count) | 🟢 Easy | — | — |

> 💡 **Reading the table:** Each problem links directly to its solution below. Where multiple approaches are provided, the *Best Performance* column shows the top `🎯 Beats` score achieved.

---

### [1757. Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/)

```sql
SELECT product_id FROM products WHERE low_fats = 'Y' AND recyclable = 'Y';
```

---

### [584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/)

```sql
SELECT name FROM customer WHERE referee_id != 2 OR referee_id IS NULL;
```

---

### [595. Big Countries](https://leetcode.com/problems/big-countries/)

```sql
SELECT name, population, area FROM world WHERE area >= 3000000 OR population >= 25000000;
```

---

### [1148. Article Views I](https://leetcode.com/problems/article-views-i/)

```sql
SELECT DISTINCT author_id AS id FROM views WHERE author_id = viewer_id ORDER BY author_id;
```

---

### [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/)

```sql
SELECT tweet_id FROM tweets WHERE LENGTH(content) > 15;
```

---

### [1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/)

```sql
SELECT U.unique_id, E.name FROM employees E LEFT JOIN employeeuni U ON E.id = U.id;
```

---

### [1068. Product Sales Analysis I](https://leetcode.com/problems/product-sales-analysis-i/)

```sql
SELECT P.product_name, S.year, S.price FROM sales S JOIN product P ON S.product_id = P.product_id;
```

---

### [1581. Customer Who Visited but Did Not Make Any Transactions](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/)

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

```sql
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id;
```
> 🎯 **Beats:** 91.25%

---

### [1141. User Activity for the Past 30 Days I](https://leetcode.com/problems/user-activity-for-the-past-30-days-i/)

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

*Coming soon...*

---

## 🔴 Hard

*Coming soon...*
