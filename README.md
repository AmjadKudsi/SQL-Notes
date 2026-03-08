# LeetCode SQL 50 — MySQL Solutions

## 🟢 Easy

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

## 🟡 Medium

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

## 🔴 Hard

*Coming soon...*
