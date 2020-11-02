CREATE OR REPLACE FUNCTION boolVal(Str TEXT)
RETURNS boolean
AS
$$
BEGIN
  IF Str IS NULL THEN
    RETURN false;
  END IF;
  IF trim(Str)='' THEN
    RETURN false;
  END IF;
  IF  upper(Str) in ('TRUE','YES','ON','1','TRUE') THEN
    RETURN true;
  END IF;
  RETURN false;
END;
$$
LANGUAGE plpgsql immutable;
