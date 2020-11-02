-- 得到IP地址归属地
CREATE OR REPLACE FUNCTION getIPLocationStr(ip TEXT,atype TEXT = 'json')
RETURNS TEXT
AS
$$
DECLARE
  url TEXT;
  _状态 int;
  _内容 TEXT;
  _city TEXT;
  _isp TEXT;
BEGIN
  SET http.timeout_msec = 1000;
  url = format('http://ip.taobao.com/service/getIpInfo.php?ip=%s',ip);
  BEGIN
  SELECT status,content into _状态,_内容 FROM http_get(url);
  EXCEPTION WHEN others THEN
    RETURN '';
  END;
  IF _状态 = 200 THEN
    _city = _内容::jsonb #>> '{data,city}';
    _isp = _内容::jsonb #>> '{data,isp}';
    IF atype = 'json' THEN
      RETURN format('{"city":"%s","isp":"%s"}',_city,_isp);
    END IF;
    RETURN _city|| _isp;
  END IF;
  IF atype='json' THEN
    RETURN '{}';
  END IF;
  RETURN '';
END;
$$
LANGUAGE plpgsql;
