--最近24小时
CREATE OR REPLACE FUNCTION last24hour()
RETURNS timestamp
AS
$$
  SELECT (current_timestamp - INTERVAL '24 hours')::timestamp;
$$
LANGUAGE sql immutable;
