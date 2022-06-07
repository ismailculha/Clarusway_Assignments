SELECT D.customer_id, D.first_name, D.last_name, 
	IIF(SUM(IIF(ISNULL( NULLIF(A.product_id,13),-1)=-1,1,0))>0,'YES','NO') AS First_product,
	IIF(SUM(IIF(ISNULL( NULLIF(A.product_id,21),-1)=-1,1,0))>0,'YES','NO') AS Second_product,
	IIF(SUM(IIF(ISNULL( NULLIF(A.product_id,16),-1)=-1,1,0))>0,'YES','NO') AS Third_product
FROM product.product A
FULL OUTER JOIN sale.order_item B
	ON A.product_id = B.product_id
INNER JOIN sale.orders C
	ON B.order_id = C.order_id
INNER JOIN sale.customer D
	ON C.customer_id = D.customer_id
WHERE B.order_id IN 
	(SELECT B.order_id 
	FROM product.product A 
	FULL OUTER JOIN sale.order_item B 
	ON A.product_id = B.product_id 
	WHERE A.product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD')
GROUP BY D.customer_id, D.first_name, D.last_name
ORDER BY D.customer_id






