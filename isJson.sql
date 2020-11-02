--判断是否是json类型兼容的
CREATE FUNCTION isJson(_json TEXT)
RETURNS boolean
AS
$$
BEGIN
  return (_json::json IS NOT NULL);
  EXCEPTION WHEN others THEN
    RETURN FALSE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;
