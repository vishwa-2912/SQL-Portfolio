-departments

INSERT INTO departments
VALUES
(1,'IT','Robert Anderson'),
(2,'Human Resources','Jennifer Smith'),
(3,'Finance','Michael Johnson'),
(4,'Sales','Emily Davis'),
(5,'Marketing','William Brown'),
(6,'Operations','Sophia Wilson'),
(7,'Customer Support','David Taylor'),
(8,'Research & Development','Olivia Martinez'),
(9,'Procurement','James Thomas'),
(10,'Administration','Emma White');

--jobs
INSERT INTO jobs
VALUES
(101,'Software Engineer',45000,90000),
(102,'Data Analyst',40000,80000),
(103,'HR Executive',35000,70000),
(104,'Finance Analyst',45000,85000),
(105,'Sales Executive',30000,70000),
(106,'Marketing Specialist',35000,75000),
(107,'Operations Manager',50000,95000),
(108,'Support Engineer',30000,65000),
(109,'Research Engineer',50000,100000),
(110,'Administrator',30000,60000);


-employees 
INSERT INTO employees
VALUES
(1001,'John','Smith','Male',28,'London','2022-01-15',65000,1,101),
(1002,'Sarah','Johnson','Female',31,'Manchester','2021-06-12',58000,2,103),
(1003,'David','Brown','Male',29,'London','2020-03-20',72000,1,102),
(1004,'Emma','Wilson','Female',35,'Birmingham','2019-08-05',85000,3,104),
(1005,'Michael','Taylor','Male',27,'Leeds','2023-01-17',42000,4,105),
(1006,'Sophia','Davis','Female',30,'London','2020-05-10',76000,1,101),
(1007,'James','Miller','Male',41,'Liverpool','2018-11-11',91000,3,104),
(1008,'Olivia','Moore','Female',26,'Manchester','2022-07-18',47000,2,103),
(1009,'Daniel','Thomas','Male',29,'Leeds','2021-09-09',43000,4,105),
(1010,'Emily','White','Female',32,'London','2019-04-15',69000,1,102),
(1011,'William','Clark','Male',34,'Bristol','2018-10-25',64000,5,106),
(1012,'Ava','Lewis','Female',25,'London','2023-02-12',51000,6,107),
(1013,'Benjamin','Walker','Male',38,'Leicester','2017-07-14',82000,8,109),
(1014,'Charlotte','Hall','Female',29,'Sheffield','2022-11-20',47000,7,108),
(1015,'Henry','Allen','Male',36,'Liverpool','2019-05-18',61000,6,107),
(1016,'Amelia','Young','Female',27,'Manchester','2023-03-15',45000,5,106),
(1017,'Lucas','King','Male',30,'London','2021-08-01',73000,8,109),
(1018,'Grace','Scott','Female',33,'Leeds','2020-12-08',59000,9,110),
(1019,'Alexander','Green','Male',37,'Birmingham','2018-09-21',81000,3,104),
(1020,'Mia','Baker','Female',24,'London','2024-01-10',40000,10,110);


-projects
INSERT INTO projects
VALUES
(201,'HR Digitalization',150000,2),
(202,'Cloud Migration',500000,1),
(203,'Financial Forecasting',250000,3),
(204,'Sales Dashboard',180000,4),
(205,'Marketing Campaign',120000,5),
(206,'Warehouse Automation',300000,6),
(207,'Customer Portal',280000,7),
(208,'AI Research',600000,8),
(209,'Vendor Management',140000,9),
(210,'Office Modernization',100000,10);

-employee projects
INSERT INTO employee_projects
VALUES
(1001,202),
(1003,202),
(1006,208),
(1010,204),
(1004,203),
(1007,203),
(1005,204),
(1009,204),
(1011,205),
(1012,206),
(1013,208),
(1014,207),
(1015,206),
(1016,205),
(1017,208),
(1018,209),
(1019,203),
(1020,210);

