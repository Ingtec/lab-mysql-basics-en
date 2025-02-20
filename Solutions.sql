-- SQL Basics (Selection and Aggregation) Lab Solutions
-- Author: Gerardo

-- Query 1: Get the id values of the first 5 clients from district_id = 1
SELECT client_id 
FROM client 
WHERE district_id = 1 
ORDER BY client_id ASC 
LIMIT 5;

-- Query 2: Get the id value of the last client where district_id = 72
SELECT client_id 
FROM client 
WHERE district_id = 72 
ORDER BY client_id DESC 
LIMIT 1;

-- Query 3: Get the 3 lowest amounts in the loan table
SELECT amount 
FROM loan 
ORDER BY amount ASC 
LIMIT 3;

-- Query 4: Get the distinct status values in the loan table (alphabetically sorted)
SELECT DISTINCT status 
FROM loan 
ORDER BY status ASC;

-- Query 5: Get the loan_id of the highest payment received
SELECT loan_id 
FROM loan 
ORDER BY payments DESC 
LIMIT 1;

-- Query 6: Get the loan amount of the lowest 5 account_ids in the loan table
SELECT account_id, amount 
FROM loan 
ORDER BY account_id ASC 
LIMIT 5;

-- Query 7: Get the account_ids with the lowest loan amount that have a loan duration of 60
SELECT account_id 
FROM loan 
WHERE duration = 60 
ORDER BY amount ASC;

-- Query 8: Get the unique values of k_symbol in the order table (escaped with backticks)
SELECT DISTINCT k_symbol 
FROM `order` 
ORDER BY k_symbol ASC;

-- Query 9: Get the order_ids of the client with account_id = 34
SELECT order_id 
FROM `order` 
WHERE account_id = 34;

-- Query 10: Get the account_ids responsible for orders between order_id 29540 and 29560 (inclusive)
SELECT DISTINCT account_id 
FROM `order` 
WHERE order_id BETWEEN 29540 AND 29560 
ORDER BY account_id ASC;

-- Query 11: Get the individual amounts sent to account_to = 30067122
SELECT amount 
FROM `order` 
WHERE account_to = 30067122;

-- Query 12: Get the trans_id, date, type, and amount of the 10 first transactions from account_id 793
SELECT trans_id, date, type, amount 
FROM trans 
WHERE account_id = 793 
ORDER BY date DESC 
LIMIT 10;

-- Query 13: Count the number of clients from each district_id (where district_id < 10)
SELECT district_id, COUNT(*) AS total_clients 
FROM client 
WHERE district_id < 10 
GROUP BY district_id 
ORDER BY district_id ASC;

-- Query 14: Count the number of cards for each type, ranked from most to least frequent
SELECT type, COUNT(*) AS card_count 
FROM card 
GROUP BY type 
ORDER BY card_count DESC;

-- Query 15: Get the top 10 account_ids based on the sum of all their loan amounts
SELECT account_id, SUM(amount) AS total_loans 
FROM loan 
GROUP BY account_id 
ORDER BY total_loans DESC 
LIMIT 10;

-- Query 16: Retrieve the number of loans issued for each day before 930907, ordered by date descending
SELECT date, COUNT(*) AS loan_count 
FROM loan 
WHERE date < 930907 
GROUP BY date 
ORDER BY date DESC;

-- Query 17: Count the number of loans issued for each unique loan duration in December 1997
SELECT date, duration, COUNT(*) AS loan_count 
FROM loan 
WHERE date BETWEEN 971201 AND 971231 
GROUP BY date, duration 
ORDER BY date ASC, duration ASC;

-- Query 18: Sum the amount of transactions for each type in account_id = 396
SELECT account_id, type, SUM(amount) AS total_amount 
FROM trans 
WHERE account_id = 396 
GROUP BY type 
ORDER BY type ASC;
