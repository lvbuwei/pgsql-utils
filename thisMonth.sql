CREATE OR REPLACE FUNCTION thisMonth()
RETURNS date
AS
$$
  SELECT date_trunc('month',current_date)::date;
$$
LANGUAGE sql immutable;
