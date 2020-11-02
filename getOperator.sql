--获取手机号对应的运营商
CREATE OR REPLACE FUNCTION getOperator(mobile TEXT)
RETURNS TEXT
AS
$$
DECLARE
  CHINAMOBILE text;
  CHINAUNICOM text;
  CHINATELECOM text;
BEGIN
  IF length(mobile) <> '11' THEN
    RETURN '';
  END IF;
  CHINAMOBILE = '^1(3[5-9]|47|49|65|95|98|5[012789]|8[23478]|7[28])[0-9]{8}|(170[356][0-9]{7})|(134[0-9][0-9]{7})';
  CHINAUNICOM = '^1(3[012]|5[56]|8[56]|45|46|66|67|7[156])[0-9]{8}|(170[4789][0-9]{7})';
  CHINATELECOM = '^1(62|33|91|99|53|7[37]|8[019]|49)[0-9]{8}|(170[0124][0-9]{7})';
  PERFORM regexp_matches(mobile,CHINAMOBILE);
  IF FOUND THEN
    RETURN '移动';
  END IF;
  PERFORM regexp_matches(mobile,CHINAUNICOM);
  IF FOUND THEN
    RETURN '联通';
  END IF;
  PERFORM regexp_matches(mobile,CHINATELECOM);
  IF FOUND THEN
    RETURN  '电信';
  END IF;
  RETURN '';
END;
$$
LANGUAGE plpgsql;
