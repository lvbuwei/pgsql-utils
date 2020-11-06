CREATE OR REPLACE FUNCTION isDec(_ TEXT)
RETURNS boolean
AS
$$
DECLARE
  d decimal(15,4);
BEGIN
  d = _::decimal(15,4);
  RETURN true;
  EXCEPTION WHEN others THEN
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

