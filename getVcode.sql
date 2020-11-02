--生成指定长度的随机验证码

CREATE OR REPLACE FUNCTION getVcode(iLen int)
RETURNS TEXT
AS
$$
DECLARE
  Result TEXT;
BEGIN
  Result = LEFT(((random()*1000000000000)::bigint)::TEXT,iLen);
  RETURN Result;
END;
$$
LANGUAGE plpgsql;
