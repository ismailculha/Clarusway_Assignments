--Create a scalar-valued function that returns the factorial of a number you gave it.

 
CREATE FUNCTION dbo.fnc_factorial
(
	@NUMBER INT
)
RETURNS NUMERIC
AS
	BEGIN
		DECLARE @RESULT NUMERIC
		SET @RESULT = 1.0
		WHILE @NUMBER > 0
			BEGIN
				SET @RESULT = @RESULT * @NUMBER
				SET @NUMBER = @NUMBER - 1
			END
		RETURN @RESULT
	END;

SELECT dbo.fnc_factorial(15)
