CREATE OR REPLACE FUNCTION monthEnd(adate DATE)
RETURNS DATE
AS
$$
BEGIN
  RETURN (date_trunc('MONTH',adate) + INTERVAL '1 MONTH - 1 day')::DATE;
END;
$$
LANGUAGE plpgsql immutable;
