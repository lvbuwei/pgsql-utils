-- 15位身份证转18位身份证
CREATE OR REPLACE FUNCTION idcard15To18(idcard TEXT)
RETURNS TEXT
AS
$$
DECLARE
  _最后数 TEXT[];
  _校验表 int[];
  _区域 TEXT;
  _生日 TEXT;
  _顺序数 TEXT;
  _最后字符 TEXT;
  _身份证数组 TEXT[];
  _date DATE;
  _ int;
BEGIN
  IF length(idcard) <> 15 THEN
    RETURN '';
  END IF;
  _最后数 = array['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
  _校验表 = array[7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
  _区域 = substring(idcard FROM 1 FOR 6);
  _生日 = substring(idcard FROM 7 FOR 6);
  _顺序数 = substring(idcard FROM 13 FOR 3);
  _生日 = '19'||_生日;
  idcard = _区域 || _生日|| _顺序数;
  _身份证数组 = regexp_split_to_array(idcard,E'\\s*');
  BEGIN
    _date = to_date(_生日,'YYYYMMDD');
    EXCEPTION WHEN others THEN
      RETURN '';
  END;
  _ = 0;
  FOR i IN 1 .. 17 LOOP
    _ = _ + ((_身份证数组[i])::int * _校验表[i]);
  END LOOP;

  --'合计:%',_;
  _最后字符 = (_最后数[(_ % 11)+1])::TEXT;
  RETURN _区域||_生日||_顺序数||_最后字符;
END;
$$
LANGUAGE plpgsql;
