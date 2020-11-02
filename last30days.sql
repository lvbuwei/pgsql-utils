CREATE OR REPLACE FUNCTION last30days()
RETURNS timestamp
AS
$$
  SELECT (current_timestamp - INTERVAL '30 days')::timestamp;
$$
LANGUAGE sql immutable;
