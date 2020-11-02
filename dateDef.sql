CREATE OR REPLACE FUNCTION dateDef(Str TEXT,def date)
RETURNS date
AS
$$
DECLARE
  d date;
BEGIN
  IF Str IS NULL THEN
    RETURN def;
  END IF;
  IF trim(Str)='' THEN
    RETURN def;
  END IF;
  RETURN  trim(Str)::date;
  EXCEPTION WHEN others THEN
    RETURN def;
END;
$$
LANGUAGE plpgsql immutable;
