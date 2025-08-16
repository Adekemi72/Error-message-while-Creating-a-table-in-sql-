# Error-message-while-Creating-a-table-in-sql-
## here are the errors i faced and how i debug them while Creating a simple table in sql 
---
‎I decided to build a small table in SQL the table contains 7 columns. these are; sale_id, product, region, order_date, quantity, unit_price and revenue.
---
## ‎Here are the errors I faced, their causes, and how I fixed them:
‎
## 1. Msg 102 … Incorrect syntax near 'ab1'

![Alt text](https://github.com/Adekemi72/Error-message-while-Creating-a-table-in-sql-/blob/main/erro%201.JPG)

##### ‎Cause: This error occurs if you miss proper punctuation (commas, quotes, semicolon) or, as in my case, forget the keyword VALUES before inserting rows.
---

## 2. The number of columns for each row in a table value constructor must be the same
‎![Alt text ](https://github.com/Adekemi72/Error-message-while-Creating-a-table-in-sql-/blob/main/error%202.JPG)

- ‎Cause: In a multi-row insert, one row had fewer/more items than the column list.
- Remedy: SQL underlined the affected row; I checked and added the missing value.

## 3. 'msg 102, level 15, state 1, line 14'
![Alt text](https://github.com/Adekemi72/Error-message-while-Creating-a-table-in-sql-/blob/main/error%203.JPG)

‎'incorrect syntax near 'sale_id'
‎'incorrect syntax near 'region'
‎
- ‎Cause: I tried to change multiple columns quickly; SQL Server needs one column per statement, and ALTER COLUMN usually requires the full definition (type + NULL/NOT NULL). E.g.

‎ALTER TABLE salestable
‎ALTER COLUMN sale_id   VARCHAR(10) 
‎ ALTER COLUMN product   VARCHAR(50)  
‎E.t.c

Remedy:
- I Change one column at a time.
  
‎ALTER TABLE salestable ALTER COLUMN sale_id   VARCHAR(10);
ALTER TABLE salestable ALTER COLUMN product   VARCHAR(50);

---
## 4. Date confusion ('5-05-2023' parsed wrong)
‎![Alt text](https://github.com/Adekemi72/Error-message-while-Creating-a-table-in-sql-/blob/main/1755079561258.jpg)

‎Cause:
- I initially set order_date as DATETIME instead of DATE.
- I typed the date in DD-MM-YYYY (05-05-2023) format instead of the safer ISO YYYY-MM-DD (2023-05-05).
‎
‎Remedy:
- I used appropriate format and a proper DATE type. I also make use of 'Case When' to update the 'order_sales' column

![Alt text](https://github.com/Adekemi72/Error-message-while-Creating-a-table-in-sql-/blob/main/case%20when.JPG)

## Key Lessons I Learned
- Put VALUES, commas, quotes, and semicolons where necessary
- When creating tables, specify character length and whether columns allow NULL. Example: Name VARCHAR(50) NOT NULL
- Read the exact error line/word, it usually points right where the fix is needed. I created up to 3 tables just because I didn't put my mind on what the syntax error was pointing at.
- I later realized that i don't have primary key😞
- Most of all these, is to check your work thoroughly before running any query.
  
- ‎Next time, I’ll create more than two tables, set up a primary key and a foreign key (secondary key), and test relationships between them.
‎
## The questions with the answers 
https://github.com/Adekemi72/Error-message-while-Creating-a-table-in-sql-/blob/main/MY%20PERSONAL%20TUTORIAL%20SQLQuery1.sql

