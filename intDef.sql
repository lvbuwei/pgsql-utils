CREATE OR REPLACE FUNCTION intDef(Str TEXT,def int)
RETURNS int
AS
$$
DECLARE
  d int;
BEGIN
  IF Str IS NULL THEN
    RETURN def;
  END IF;
  IF trim(Str)='' THEN
    RETURN def;
  END IF;
  RETURN  trim(Str)::int;
  EXCEPTION WHEN others THEN
    RETURN def;
END;
$$
LANGUAGE plpgsql immutable;
