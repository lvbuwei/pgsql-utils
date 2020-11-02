--最近48小时
CREATE OR REPLACE FUNCTION last48hour()
RETURNS timestamp
AS
$$
  SELECT (current_timestamp - INTERVAL '48 hours')::timestamp;
$$
LANGUAGE sql immutable;
