CREATE OR REPLACE FUNCTION Last365Days()
RETURNS timestamp
AS
$$
  SELECT (current_date-365)::timestamp
$$
LANGUAGE sql immutable;
