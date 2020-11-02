CREATE OR REPLACE FUNCTION isTimeStamp(_ TEXT)
RETURNS boolean
AS
$$
DECLARE
  t timestamp;
BEGIN
  t = _::timestamp;
  RETURN true;
  EXCEPTION WHEN others THEN
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;
