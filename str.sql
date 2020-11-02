CREATE OR REPLACE FUNCTION str(Value TEXT,def TEXT='')
RETURNS TEXT
AS
$$
DECLARE
  v TEXT;
BEGIN
  v =  REPLACE(trim(coalesce(Value,'')),E'\t','');
  IF def <> '' AND v = ''then
    RETURN def;
  END IF;
  RETURN v;
END;
$$
LANGUAGE plpgsql immutable;
