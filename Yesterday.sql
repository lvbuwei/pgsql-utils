CREATE OR REPLACE FUNCTION Yesterday()
RETURNS timestamp
AS
$$
  SELECT (current_date-1)::timestamp
$$
LANGUAGE sql immutable;
