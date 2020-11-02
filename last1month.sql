--最近一个月
CREATE OR REPLACE FUNCTION last1month()
RETURNS timestamp
AS
$$
  SELECT (current_timestamp - INTERVAL '1 month')::timestamp;
$$
LANGUAGE sql immutable;
