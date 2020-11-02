--最近100天
CREATE OR REPLACE FUNCTION last100days()
RETURNS timestamp
AS
$$
  SELECT (current_timestamp - INTERVAL '100 days')::timestamp;
$$
LANGUAGE sql immutable;
