CREATE OR REPLACE FUNCTION nextMonth()
RETURNS date
AS
$$
  SELECT (date_trunc('month',current_date)::date+ INTERVAL '1 month')::date;
$$
LANGUAGE sql immutable;

CREATE OR REPLACE FUNCTION nextMonth(aMonth TEXT)
RETURNS date
AS
$$
  SELECT (date_trunc('month',(aMonth||'-01')::date)::date+ INTERVAL '1 month')::date;
$$
LANGUAGE sql immutable;
