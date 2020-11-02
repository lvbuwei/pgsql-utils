CREATE OR REPLACE FUNCTION Tomorrow()
RETURNS timestamp
AS
$$
  SELECT (current_date+1)::timestamp
$$
LANGUAGE sql immutable;
