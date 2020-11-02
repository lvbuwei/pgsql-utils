CREATE OR REPLACE FUNCTION monthBegin(adate DATE)
RETURNS DATE
AS
$$
BEGIN
  RETURN date_trunc('month', adate);
END;
$$
LANGUAGE plpgsql immutable;
