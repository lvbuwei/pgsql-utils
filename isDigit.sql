CREATE OR REPLACE FUNCTION isDigit(TEXT)
RETURNS boolean
AS
$$
  SELECT $1 ~ '^[0-9]+$' AS Result;
$$
LANGUAGE sql;
