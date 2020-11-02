CREATE OR REPLACE FUNCTION timeDef(Str TEXT,def timestamp)
RETURNS timestamp
AS
$$
DECLARE
  d timestamp;
BEGIN
  IF Str IS NULL THEN
    RETURN def;
  END IF;
  IF trim(Str)='' THEN
    RETURN def;
  END IF;
  RETURN  trim(Str)::timestamp(0);
  EXCEPTION WHEN others THEN
    RETURN def;
END;
$$
LANGUAGE plpgsql immutable;
