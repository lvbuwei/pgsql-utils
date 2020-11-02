CREATE OR REPLACE FUNCTION last1minutes()
RETURNS timestamp
AS
$$
  SELECT (current_timestamp - INTERVAL '1 minutes')::timestamp;
$$
LANGUAGE sql immutable;
