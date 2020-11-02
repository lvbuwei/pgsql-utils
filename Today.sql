CREATE OR REPLACE FUNCTION Today()
RETURNS timestamp
AS
$$
  SELECT (current_date)::timestamp
$$
LANGUAGE sql immutable;
