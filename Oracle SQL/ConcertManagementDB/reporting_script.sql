/*
1. Write a query to display the producer number, producer name, concert ID,
concert name, concert date, and concert budget for each concert.

Format the producer number, producer name, concert ID, concert name, and
budget appropriately.

Sort the results by producer name and concert date.
*/
COLUMN ProducerName FORMAT A15
COLUMN Budget FORMAT $9,999,999.99
COLUMN ConcertName FORMAT A32
COLUMN ConcertDate FORMAT A18

SELECT p.ProdNo,
       p.Name AS ProducerName,
       c.ConcertId,
       c.Name AS ConcertName,
       TO_CHAR(c.ConcertDate, 'YYYY-MM HH:MI PM') AS ConcertDate,
       c.Budget
FROM Producer p
JOIN Concert c ON p.ProdNo = c.ProdNo
ORDER BY p.Name, c.ConcertDate;

/*
2. Write a query to display the producer number, producer name, and total
budget of the concerts produced by each producer.

Only display producers whose total concert budget is greater than $300,000.
*/
COLUMN TotalBudget FORMAT $999,999.99

SELECT p.ProdNo, p.Name AS ProducerName, SUM(c.Budget) AS TotalBudget
FROM Producer p
JOIN Concert c ON p.ProdNo = c.ProdNo
GROUP BY p.ProdNo, p.Name
HAVING SUM(c.Budget) > 300000;

/*
3. Write a query to display each producer's name and the number of concerts
that producer is responsible for.

Only display producers who are responsible for more than two concerts.

Sort the results from the greatest number of concerts to the least.
*/
SELECT p.Name AS ProductionCompany,
       COUNT(c.ConcertId) AS ProducedNum
FROM Producer p
JOIN Concert c ON p.ProdNo = c.ProdNo
GROUP BY p.Name
HAVING COUNT(c.ConcertId) > 2
ORDER BY ProducedNum DESC;

/*
4. Write a query to display each customer's first name, last name, the name
of the concert they attended, the city where the concert was held, and the
amount they paid to attend.
*/
COLUMN CustomerName FORMAT A15
COLUMN ConcertName FORMAT A25
COLUMN ConcertLocation FORMAT A15
COLUMN Cost FORMAT $99.99

SELECT  cus.LName || ', ' || cus.FName AS CustomerName, 
        con.Name AS ConcertName, 
        con.City || ', ' || con.State AS ConcertLocation, 
        att.Cost as Cost
FROM Customer cus
JOIN Attends att ON cus.CustNo = att.CustNo
JOIN Concert con ON att.ConcertId = con.ConcertId;

/*
5. Write a query to display each customer's customer number, first name,
last name, and the total amount they have spent attending concerts.

Only display customers whose total amount spent is greater than $20.

Sort the results from the highest amount spent to the lowest.
*/
COLUMN FullName FORMAT A25
COLUMN TotalSpent FORMAT $999.99

SELECT c.CustNo,
       c.FName || ' ' || c.LName AS FullName,
       SUM(a.Cost) AS TotalSpent
FROM Customer c
JOIN Attends a ON c.CustNo = a.CustNo
GROUP BY c.CustNo, c.FName, c.LName
HAVING SUM(a.Cost) > 20
ORDER BY TotalSpent DESC;

/*
6. Write a query to display the concert ID, concert name, and average ticket
cost for each concert.

Only display concerts whose average ticket cost is greater than $15.
*/
COLUMN ConcertName FORMAT A12
COLUMN AvgTicket FORMAT $99.99

SELECT c.ConcertId, c.Name AS ConcertName, AVG(a.Cost) AS AvgTicket
FROM Concert c 
JOIN Attends a ON c.ConcertId = a.ConcertId
GROUP BY c.ConcertId, c.Name
HAVING AVG(a.Cost) > 15;

/*
7. Write a query to display each concert name and the number of customers
who attended that concert.

Only display concerts that were attended by at least two customers.

Sort the results from the highest attendance to the lowest.
*/
COLUMN ConcertName FORMAT A12

SELECT c.Name AS ConcertName,
       COUNT(a.CustNo) AS CusAttend
FROM Concert c
JOIN Attends a ON c.ConcertId = a.ConcertId
GROUP BY c.Name
HAVING COUNT(a.CustNo) >= 2
ORDER BY CusAttend DESC;

/*
8. Write a query to display the concert ID, concert name, number of attendees,
and total ticket revenue for each concert.

Only display concerts that generated more than $50 in total ticket revenue.
*/
COLUMN ConcertName FORMAT A25
COLUMN TotalRevenue FORMAT $99.99

SELECT  c.ConcertId, c.Name AS ConcertName, 
        COUNT(a.CustNo) AS "CustAttend", SUM(a.Cost) As TotalRevenue
FROM Concert c
JOIN Attends a ON c.ConcertId = a.ConcertId
GROUP BY c.ConcertId, c.Name
HAVING SUM(a.Cost) > 50;

/*
9. Write a query to display each producer's name, the number of concerts they
produced, and the average budget of those concerts.

Only display producers whose average concert budget is greater than $150,000.

Remember that some concert budgets contain NULL values.
*/
COLUMN ProdName FORMAT A15
COLUMN AvgBudget FORMAT $999,999.99

SELECT p.Name AS ProdName,
       COUNT(c.ConcertId) AS Produced,
       AVG(c.Budget) AS AvgBudget
FROM Producer p
JOIN Concert c ON p.ProdNo = c.ProdNo
GROUP BY p.Name
HAVING AVG(c.Budget) > 150000;
/*
10. Write a query to display each customer's last name, first name, the concert
they attended, the producer responsible for that concert, and the amount the
customer paid.

Sort the results by producer name, concert name, and customer last name.
*/
COLUMN LName FORMAT A5
COLUMN FName FORMAT A8
COLUMN Concert FORMAT A25
COLUMN Producer FORMAT A12

SELECT  cus.LName, cus.FName, con.Name AS Concert, 
        prd.Name AS Producer, att.Cost
FROM Customer cus
JOIN Attends att ON cus.CustNo = att.CustNo
JOIN Concert con ON att.ConcertId = con.ConcertId
JOIN Producer prd ON con.ProdNO = prd.ProdNo
ORDER BY prd.Name, con.Name, cus.LName;

/*
11. Write a query to display each producer's name and the total ticket revenue
generated from customers attending that producer's concerts.

Only display producers whose concerts generated more than $50 in total ticket
revenue.
*/
COLUMN ProducerName FORMAT A15
COLUMN TotalRevenue FORMAT $999,999.99

SELECT p.Name AS ProducerName,
       SUM(a.Cost) AS TotalRevenue
FROM Producer p
JOIN Concert c ON p.ProdNo = c.ProdNo
JOIN Attends a ON c.ConcertId = a.ConcertId
GROUP BY p.Name
HAVING SUM(a.Cost) > 50;

/*
12. Write a query to display each customer's customer number, first name,
last name, and the number of concerts they attended.

Only display customers who attended at least two concerts.

Sort the results from the customer who attended the most concerts to the
customer who attended the fewest.
*/
SELECT c.CustNo,
       c.FName,
       c.LName,
       COUNT(a.ConcertId) AS ConcertsAttended
FROM Customer c
JOIN Attends a ON c.CustNo = a.CustNo
GROUP BY c.CustNo, c.FName, c.LName
HAVING COUNT(a.ConcertId) >= 2
ORDER BY ConcertsAttended DESC;

/*
13. Write a query to display each customer's first name, last name, and average
ticket cost.

Only display customers whose average ticket cost is greater than $15.
*/
COLUMN AvgTicket FORMAT $99.99

SELECT c.FName, c.LName, AVG(a.Cost) AS AvgTicket
FROM Customer c
JOIN Attends a ON c.CustNo = a.CustNo
GROUP BY c.FName, c.LName
HAVING AVG(a.Cost) > 15;

/*
14. Write a query to display each concert's name, budget, number of attendees,
and total ticket revenue.

Only display concerts that had at least two attendees AND generated more
than $25 in ticket revenue.
*/
COLUMN ConcertName FORMAT A25
COLUMN Budget FORMAT $999,999.99
COLUMN TicketRevenue FORMAT $999.99

SELECT c.Name AS ConcertName,
       c.Budget,
       COUNT(a.CustNo) AS NumAttendees,
       SUM(a.Cost) AS TicketRevenue
FROM Concert c
JOIN Attends a ON c.ConcertId = a.ConcertId
GROUP BY c.ConcertId, c.Name, c.Budget
HAVING COUNT(a.CustNo) >= 2
AND SUM(a.Cost) > 25;

/*
15. Write a query to display the producer number, producer name, number of
concerts produced, total concert budget, average concert budget, highest
concert budget, and lowest concert budget for each producer.

Only display producers whose total concert budget is greater than $250,000.
*/
COLUMN ProdName FORMAT A15
COLUMN TotalConBudget FORMAT $999,999.99
COLUMN AvgConBudget FORMAT $999,999.99
COLUMN MaxConBudget FORMAT $999,999.99
COLUMN MinConBudget FORMAT $999,999.99

SELECT p.ProdNo,
       p.Name AS ProdName,
       COUNT(c.ConcertId) AS NumConProd,
       SUM(c.Budget) AS TotalConBudget,
       AVG(c.Budget) AS AvgConBudget,
       MAX(c.Budget) AS MaxConBudget,
       MIN(c.Budget) AS MinConBudget
FROM Producer p
JOIN Concert c ON p.ProdNo = c.ProdNo
GROUP BY p.ProdNo, p.Name
HAVING SUM(c.Budget) > 250000;
