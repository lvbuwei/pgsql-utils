--检查身份证号码是否是有效

CREATE OR REPLACE FUNCTION checkIDCardSimple(idcard TEXT)
RETURNS bool
AS
$$
DECLARE
  _最后数 TEXT[];
  _校验表 int[];

  _校验码  TEXT;
  _ int;
  _身份证数组 TEXT[];
BEGIN
  _最后数 = array['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
  _校验表 = array[7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];

  idcard = upper(trim(idcard));
  IF length(idcard) <> 18 THEN
    RETURN false;
  END IF;
  _校验码 = substring(idcard FROM 18 FOR 1);
  IF NOT (_校验码 = ANY(_最后数)) THEN
    RETURN false;
  END IF;
  _ = 0;
  _身份证数组 = regexp_split_to_array(idcard,E'\\s*');
  FOR i IN 1 .. 17 LOOP
    _ = _ + (_身份证数组[i])::int * _校验表[i];
  END LOOP;
  IF _最后数[(_ % 11)+1] = substring(idcard FROM 18 FOR 1) THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;
END;
$$
LANGUAGE plpgsql;
