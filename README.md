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

**Using Self Join**
```sql
SELECT w1.id
FROM weather w1
JOIN weather w2
  ON w2.recordDate = w1.recordDate - INTERVAL '1' DAY
WHERE w1.temperature > w2.temperature;
```

**Using Correlated Subquery**
```sql
SELECT id FROM weather w1
WHERE w1.temperature > (
  SELECT w2.temperature FROM weather w2
  WHERE w2.recordDate = w1.recordDate - INTERVAL '1' DAY
);
```

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

---

### [1661. Average Time of Process per Machine](https://leetcode.com/problems/average-time-of-process-per-machine/)

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

---

### [577. Employee Bonus](https://leetcode.com/problems/employee-bonus/)

```sql
SELECT e.name, b.bonus FROM employee e LEFT JOIN bonus b ON e.empId = b.empId
WHERE bonus < 1000 OR bonus IS NULL;
```

---

### [1280. Students and Examinations](https://leetcode.com/problems/students-and-examinations/)

```sql
SELECT st.student_id, st.student_name, su.subject_name, COUNT(e.subject_name) AS attended_exams
FROM students st CROSS JOIN subjects su LEFT JOIN examinations e
    ON st.student_id = e.student_id AND e.subject_name = su.subject_name
GROUP BY st.student_id, st.student_name, su.subject_name
ORDER BY st.student_id, st.student_name;
```

---

## 🟡 Medium

---

### [570. Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/)

```sql
SELECT e.name FROM employee e
WHERE e.id IN (SELECT managerId FROM employee
                WHERE managerId IS NOT NULL
                GROUP BY managerId
                HAVING COUNT(*) > 4);
```

---

---

## 🔴 Hard

*Coming soon...*
