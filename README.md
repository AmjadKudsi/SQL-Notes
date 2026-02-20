# LeetCode SQL 50 — MySQL Solutions

A complete walkthrough of the [LeetCode SQL 50](https://leetcode.com/studyplan/top-sql-50/) challenge, solved in **MySQL**.
Each problem includes multiple approaches where applicable, labeled by technique.

---

## Table of Contents

- [Easy](#-easy)
  - [1757. Recyclable and Low Fat Products](#1757-recyclable-and-low-fat-products)
  - [584. Find Customer Referee](#584-find-customer-referee)
  - [595. Big Countries](#595-big-countries)
  - [1148. Article Views I](#1148-article-views-i)
  - [1683. Invalid Tweets](#1683-invalid-tweets)
  - [1378. Replace Employee ID With The Unique Identifier](#1378-replace-employee-id-with-the-unique-identifier)
  - [1068. Product Sales Analysis I](#1068-product-sales-analysis-i)
  - [1581. Customer Who Visited but Did Not Make Any Transactions](#1581-customer-who-visited-but-did-not-make-any-transactions)
  - [197. Rising Temperature](#197-rising-temperature)
  - [1661. Average Time of Process per Machine](#1661-average-time-of-process-per-machine)
- [Medium](#-medium)
- [Hard](#-hard)

---

## 🟢 Easy

---

### [1757. Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/)

![Easy](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

#### Approach 1: Using WHERE with AND

```sql
SELECT product_id FROM products WHERE low_fats = 'Y' AND recyclable = 'Y';
```

---

### [584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/)

![Easy](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

#### Approach 1: Using WHERE with OR and IS NULL

```sql
SELECT name FROM customer WHERE referee_id != 2 OR referee_id IS NULL;
```

---

### [595. Big Countries](https://leetcode.com/problems/big-countries/)

![Easy](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

#### Approach 1: Using WHERE with OR

```sql
SELECT name, population, area FROM world WHERE area >= 3000000 OR population >= 25000000;
```

---

### [1148. Article Views I](https://leetcode.com/problems/article-views-i/)

![Easy](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

#### Approach 1: Using WHERE with DISTINCT

```sql
SELECT DISTINCT author_id AS id FROM views WHERE author_id = viewer_id ORDER BY author_id;
```

---

### [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/)

![Easy](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

#### Approach 1: Using LENGTH

```sql
SELECT tweet_id FROM tweets WHERE LENGTH(content) > 15;
```

---

### [1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/)

![Easy](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

#### Approach 1: Using LEFT JOIN

```sql
SELECT U.unique_id, E.name FROM employees E LEFT JOIN employeeuni U ON E.id = U.id;
```

---

### [1068. Product Sales Analysis I](https://leetcode.com/problems/product-sales-analysis-i/)

![Easy](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

#### Approach 1: Using JOIN

```sql
SELECT P.product_name, S.year, S.price FROM sales S JOIN product P ON S.product_id = P.product_id;
```

---

### [1581. Customer Who Visited but Did Not Make Any Transactions](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/)

![Easy](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

#### Approach 1: Using LEFT JOIN with IS NULL

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

![Easy](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

#### Approach 1: Using LAG

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

#### Approach 2: Using Self Join

```sql
SELECT w1.id
FROM weather w1
JOIN weather w2
  ON w2.recordDate = w1.recordDate - INTERVAL '1' DAY
WHERE w1.temperature > w2.temperature;
```

#### Approach 3: Using Correlated Subquery

```sql
SELECT id FROM weather w1
WHERE w1.temperature > (
  SELECT w2.temperature FROM weather w2
  WHERE w2.recordDate = w1.recordDate - INTERVAL '1' DAY
);
```

#### Approach 4: Using EXISTS

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

#### Approach 5: Using Window Function with DATE_DIFF

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

![Easy](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

#### Approach 1: Using Correlated Subquery

```sql
SELECT machine_id, ROUND(AVG((SELECT a2.timestamp FROM activity a2
  WHERE a2.machine_id = a1.machine_id
    AND a2.process_id = a1.process_id
    AND a2.activity_type = 'end') - a1.timestamp), 3) AS processing_time
FROM activity a1
WHERE a1.activity_type = 'start'
GROUP BY machine_id;
```

#### Approach 2: Using Conditional Aggregation in Subquery

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

#### Approach 3: Using Self Join

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

## 🟡 Medium

*Coming soon...*

---

## 🔴 Hard

*Coming soon...*
