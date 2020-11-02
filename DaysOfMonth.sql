--指定日期的这个月的天数
CREATE OR REPLACE FUNCTION DaysOfMonth(aDate date)
RETURNS int
AS
$$
DECLARE
BEGIN
  --RETURN extract(days FROM date_trunc('month', aDate::date) + interval '1 month - 1 day');
  RETURN date_part('days',(aDate + interval '1 month' ) - aDate);
END;
$$
LANGUAGE plpgsql immutable;
