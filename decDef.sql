CREATE OR REPLACE FUNCTION decDef(Str TEXT,def decimal(10,2))
RETURNS decimal(10,2)
AS
$$
DECLARE
  d decimal(10,2);
BEGIN
  IF Str IS NULL THEN
    RETURN def;
  END IF;
  IF trim(Str)='' THEN
    RETURN def;
  END IF;
  RETURN  trim(Str)::decimal(10,2);
  EXCEPTION WHEN others THEN
    RETURN def;
END;
$$
LANGUAGE plpgsql immutable;
