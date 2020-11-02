CREATE OR REPLACE FUNCTION weekdow(days integer)
  RETURNS text AS
$BODY$
BEGIN
  IF days=0 THEN
    RETURN '星期日';
  ELSIF days=1 THEN
    RETURN '星期一';
  ELSIF days=2 THEN
    RETURN '星期二';
  ELSIF days=3 THEN
    RETURN '星期三';
  ELSIF days=4 THEN
    RETURN '星期四';
  ELSIF days=5 THEN
    RETURN '星期五';
  ELSIF days=6 THEN
    RETURN '星期六';
  END IF;
  RETURN '';
END;
$BODY$
  LANGUAGE plpgsql;
