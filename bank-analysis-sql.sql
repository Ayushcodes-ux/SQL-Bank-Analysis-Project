create table customers(
customer_id SERIAL PRIMARY KEY,
customer_name  varchar(100),
gender varchar(10),
age int,
city varchar(50),
occupation varchar(50)
);

insert into customers(customer_name,gender,age,city,occupation)
values
('Rahul Sharma','Male',28,'Delhi','Engineer'),
('Priya Singh','Female',34,'Mumbai','Teacher'),
('Amit Kumar','Male',42,'Bengaluru','Manager'),
('Sneha Patel','Female',30,'Ahmedabad','Doctor'),
('Rohan Gupta','Male',37,'Jaipur','Business'),
('Ankit Verma','Male',29,'Delhi','Engineer'),
('Pooja Mehta','Female',31,'Mumbai','Accountant'),
('Vikas Yadav','Male',40,'Lucknow','Business'),
('Neha Jain','Female',27,'Pune','Software Developer'),
('Karan Malhotra','Male',35,'Chandigarh','Manager');

select * from customers;



create table branches (
branch_id SERIAL PRIMARY KEY,
branch_name varchar(100),
city varchar(50)

);

insert into branches
(branch_name,city)
values
('Delhi Branch','Delhi'),
('Mumbai Branch','Mumbai'),
('Bengaluru Branch','Bengaluru'),
('Ahmedabad Branch','Ahmedabad'),
('Jaipur Branch','Jaipur');

select * from branches;


create table loans(
loans_id SERIAL PRIMARY KEY,
customer_id int references customers(customer_id),
branch_id int references branches(branch_id),
loan_amount numeric(12,2),
intrest_rate numeric(5,2),
loan_status varchar(50),
loan_date  date 

);

insert into loans(customer_id,branch_id,loan_amount,intrest_rate, loan_status,loan_date)
values
(1,1,500000,8.5,'Approved','2025-01-10'),
(2,2,300000,9.0,'Rejected','2025-01-12'),
(3,3,800000,7.5,'Approved','2025-01-15'),
(4,4,450000,8.0,'Approved','2025-01-18'),
(5,5,600000,9.5,'Pending','2025-01-20'),
(6,1,350000,8.2,'Approved','2025-02-02'),
(7,2,420000,8.8,'Approved','2025-02-05'),
(8,3,900000,7.2,'Approved','2025-02-10'),
(9,4,250000,9.1,'Rejected','2025-02-12'),
(10,5,700000,8.4,'Approved','2025-02-15'),
(1,1,200000,8.9,'Approved','2025-03-01'),
(2,2,550000,8.1,'Pending','2025-03-04'),
(3,3,1000000,7.0,'Approved','2025-03-07'),
(4,4,300000,8.7,'Rejected','2025-03-10'),
(5,5,650000,9.0,'Approved','2025-03-12'),
(6,1,480000,8.3,'Approved','2025-03-15'),
(7,2,520000,8.6,'Approved','2025-03-18'),
(8,3,750000,7.8,'Pending','2025-03-20'),
(9,4,400000,8.9,'Approved','2025-03-22'),
(10,5,850000,7.9,'Approved','2025-03-25');

select * from loans;

select SUM(loan_amount) as total_loan_amount
from loans


select count(*) as total_loans from loans;

select 
loan_status, count(*) as total_lones from loans 
group by loan_status;


SELECT
c.customer_name,
l.loan_amount,
l.loan_status
FROM loans l
JOIN customers c
ON l.customer_id = c.customer_id;

SELECT
b.branch_name,
SUM(l.loan_amount) AS total_loan_amount
FROM loans l
JOIN branches b
ON l.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_loan_amount DESC;


SELECT
c.occupation,
COUNT(*) AS total_loans
FROM loans l
JOIN customers c
ON l.customer_id = c.customer_id
GROUP BY c.occupation
ORDER BY total_loans DESC;

SELECT
TO_CHAR(loan_date,'Mon YYYY') AS month,
SUM(loan_amount) AS total_loan
FROM loans
GROUP BY month
ORDER BY month;


SELECT
b.branch_name,
ROUND(AVG(l.intrest_rate),2) AS avg_interest_rate
FROM loans l
JOIN branches b
ON l.branch_id = b.branch_id
GROUP BY b.branch_name;



