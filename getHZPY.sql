--汉字转拼音首字母的函数
DO
$$
BEGIN
  CREATE TABLE IF NOT EXISTS hanzibianmabiao
  (
    hanzi character varying(100) NOT NULL,
    quanpin character varying(100),
    wubi character varying(100),
    zhengma character varying(100),
    unicode character varying(100),
    gbk character varying(100),
    bihuashu character varying(100),
    bushou character varying(100),
    bihuabianhao character varying(100)
  );
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getHZPY(str TEXT)
RETURNS TEXT
AS
$$
DECLARE
  pinyin TEXT;
  cnstr TEXT;
  pinr rECORD;
  sql TEXT;
BEGIN
  IF str IS NULL THEN
    RETURN '';
  END IF;
  IF trim(str) = '' THEN
    RETURN '';
  END IF;
  str = replace(str,' ','');
  pinyin = '';
  cnstr = str;
  sql = 'select han.t,coalesce(m.quanpin,han.t)as quanpin from (select t from regexp_split_to_table(''' || cnstr || ''', '''') t)  han left join hanzibianmabiao m on m.hanzi=han.t';

  FOR pinr IN EXECUTE sql LOOP
    IF length(pinr.quanpin)>0 THEN
      pinyin := pinyin || upper(substring(pinr.quanpin FROM 1 FOR 1));
    else
      pinyin := pinyin || upper(substring(pinr.quanpin FROM 1 FOR 1));
    END IF;
  END LOOP;
  IF pinyin IS NULL THEN
    RETURN str;
  ELSE
    RETURN pinyin;
  END IF;
END;
$$
LANGUAGE plpgsql;
