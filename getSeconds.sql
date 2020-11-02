--得到时间差的总秒数,有可能是负数
CREATE OR REPLACE FUNCTION getSeconds(begintime timestamp without time zone,endtime timestamp without time zone)
RETURNS int
AS
$$
BEGIN
RETURN (extract(epoch FROM endtime) - extract(epoch FROM begintime))::int;
END;
$$
LANGUAGE plpgsql;

