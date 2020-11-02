CREATE OR REPLACE FUNCTION last5minutes()
RETURNS timestamp
AS
$$
  SELECT (current_timestamp - INTERVAL '5 minutes')::timestamp;
$$
LANGUAGE sql immutable;
