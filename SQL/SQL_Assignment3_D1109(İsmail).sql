
CREATE TABLE actions (
Visitor_ID INT IDENTITY(1,1) PRIMARY KEY,
Adv_Type VARCHAR(1),
[Action] VARCHAR (10)
);

INSERT actions VALUES ('A','Left'),
	('A','Order'),
	('B','Left'),
	('A','Order'),
	('A','Review'),
	('A','Left'),
	('B','Left'),
	('B','Order'),
	('B','Review'),
	('A','Review');



SELECT Adv_Type, [Action] ,COUNT([Action]) 
FROM actions 
GROUP BY Adv_Type, [Action]
ORDER BY Adv_Type



SET STATISTICS IO ON
SELECT B.Adv_Type, 
CONVERT(NUMERIC(3,2), COUNT(*)*1.0 / (SELECT COUNT(Adv_Type) FROM actions WHERE  Adv_Type =  B.Adv_Type)*1.0)
FROM actions B
WHERE B.[Action] = 'Order'
GROUP BY B.Adv_Type







