CREATE OR REPLACE FUNCTION last1hours()
RETURNS timestamp
AS
$$
  SELECT (current_timestamp - INTERVAL '1 hours')::timestamp;
$$
LANGUAGE sql immutable;
