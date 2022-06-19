--1. Sum and count of the products were calculated according to discount and result were ordered by discount asc.
--2. The totals were subtracted from the previous discount total and looked for an increasing or decreasing relationship.
--3. According to relationship, a score of -1, 0 and 1 was given
--4. A positive correlation was determined for those with a total score above 0, 
--	a negative relationship for those with a total score below 0, and 
--	a neutral situation for those with a total score equal to 0.

SELECT product_id, 
	CASE 
	WHEN SUM(SONUC) > 0 THEN 'Positive'
	WHEN SUM(SONUC) < 0 THEN 'Negative'
	ELSE 'Neutral'
	END Discount_Effect
FROM (
SELECT *, 
CASE
	WHEN dýff_sum > 0 THEN 1
	WHEN dýff_sum < 0 THEN -1
	ELSE 0
	END sonuc
FROM(
SELECT *, LAG(sale_sum) OVER(PARTITION BY product_id ORDER BY discount) AS previous_sum,
	sale_sum - LAG(sale_sum) OVER(PARTITION BY product_id ORDER BY discount)  AS dýff_sum
FROM( 
	SELECT DISTINCT PP.product_id, PP.product_name, SI.discount, COUNT(*) OVER(PARTITION BY PP.product_id, SI.discount) AS sale_count,
	SUM(quantity) OVER(PARTITION BY PP.product_id, SI.discount) AS sale_sum
	FROM product.product PP, sale.order_item SI
	WHERE PP.product_id = SI.product_id
) 
AS table1
)
AS table2
WHERE NOT previous_sum IS NULL ) as table3
GROUP BY product_id;


