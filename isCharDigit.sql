CREATE OR REPLACE FUNCTION isCharDigit(TEXT)
RETURNS boolean
AS
$$
  SELECT $1 ~ '^[a-zA-Z0-9]*$' AS Result;
$$
LANGUAGE sql;
