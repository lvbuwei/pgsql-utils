CREATE OR REPLACE FUNCTION isTimeStamp(_ TEXT)
RETURNS boolean
AS
$$
DECLARE
  t timestamp;
BEGIN
  IF _ IS NULL THEN
    RETURN false;
  END IF;
  t = _::timestamp;
  RETURN true;
  EXCEPTION WHEN others THEN
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;
