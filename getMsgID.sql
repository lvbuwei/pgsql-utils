--获取一个md5类型的流水号
CREATE OR REPLACE FUNCTION getMsgID()
RETURNS TEXT
AS
$$
BEGIN
  return md5(now()::text||random()::text);
END;
$$
LANGUAGE plpgsql;
