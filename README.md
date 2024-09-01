Overview
Welcome to the SQL Query Hub repository! This repository is a comprehensive collection of SQL queries, showcasing the fundamental and advanced operations you can perform with SQL. Whether you're just starting 
out or looking to refine your skills, this hub covers a wide range of SQL functionalities.

Repository Structure

1. Basic Queries
Overview: This section includes the foundational SQL queries essential for database interaction.
Content:
SELECT statements
WHERE clause for filtering data
ORDER BY for sorting results
LIMIT for restricting the number of rows returned
INSERT INTO for adding new records

2. Aggregate Functions
Overview: Explore SQL's powerful aggregation capabilities to summarize and analyze data.
Content:
COUNT(), SUM(), AVG() for basic data aggregation
MIN(), MAX() for finding the smallest and largest values
GROUP BY for grouping data
HAVING for filtering grouped data

3. Joins
Overview: Learn how to combine data from multiple tables using different types of joins.
Content:
INNER JOIN for matching records in both tables
LEFT JOIN for including all records from the left table
RIGHT JOIN for including all records from the right table
FULL OUTER JOIN for combining records with no matches in both tables
CROSS JOIN for creating a Cartesian product

4. Operators
Overview: Master the use of SQL operators to perform logical and mathematical operations.
Content:
Arithmetic operators: +, -, *, /
Comparison operators: =, !=, >, <, >=, <=
Logical operators: AND, OR, NOT
Special operators: BETWEEN, IN, LIKE

5.Union, Intersection, Union All
Overview: Learn how to combine result sets from multiple queries using set operations. Content:
Content:
UNION: Combines results from two or more queries, removing duplicates.
INTERSECTION: Retrieves only the common records between multiple queries.
UNION ALL: Combines results from two or more queries, including duplicates.

6.Date Functions
Overview: Utilize date functions to manipulate and extract information from date and time data types. Content:
Content:
CURDATE(): Returns the current date.
DATE_ADD(): Adds a specified time interval to a date.
DATEDIFF(): Calculates the difference between two dates.
EXTRACT(): Extracts a part of the date, such as year, month, or day.

7. Subqueries
Overview: Dive into subqueries, which are queries nested within another query. Content:
Content:
Single-row Subqueries: Return a single row of results.
Multi-row Subqueries: Return multiple rows of results.
Correlated Subqueries: Refer to columns from the outer query.

8. Case Statements
Overview: Implement conditional logic directly in SQL queries using the CASE statement. Content:
Content:
Simple CASE: Compares an expression to a set of values.
Searched CASE: Evaluates a set of conditions and returns the result for the first true condition.

9. Limit and Offset
Overview: Control the number of rows returned by a query and specify the starting point of the result set. Content:
Content:
LIMIT: Restricts the number of rows returned.
OFFSET: Specifies the starting point within the result set.

10. Transactions (Commit, Rollback, Savepoint, Begin)
Overview: Manage and control transactions to ensure data integrity. Content:
Content:
BEGIN: Marks the start of a transaction.
COMMIT: Saves all changes made during the transaction.
ROLLBACK: Reverts changes made during the transaction to the last savepoint or the start of the transaction.
SAVEPOINT: Sets a point within a transaction to which you can later roll back.

11. Like
Overview: Use pattern matching to search for specific data within columns. Content:
Content:
LIKE: Searches for a specified pattern in a column.
%: Represents zero or more characters.
_ : Represents a single character.

12. Exists
Overview: Test for the existence of rows in a subquery. Content:
Content:
EXISTS: Returns true if the subquery returns one or more rows.

13. Any/All
Overview: Compare a value to a set of values or check if a condition applies to any or all elements in a subquery. Content:
Content:
ANY: Returns true if any of the subquery values meet the condition.
ALL: Returns true if all the subquery values meet the condition.

14. Extract
Overview: Extract specific parts of a date, time, or timestamp. Content:
Content:
EXTRACT(): Retrieves a specific part of the date or time, such as the year, month, day, hour, etc.
