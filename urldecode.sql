--url解码
CREATE OR REPLACE FUNCTION urldecode(url text)
RETURNS text
AS
$$
DECLARE
  ret text;
BEGIN
 BEGIN
    WITH STR AS (
      SELECT
      case when $1 ~ '^%[0-9a-fA-F][0-9a-fA-F]'
           then array['']
           end
      || regexp_split_to_array ($1,'(%[0-9a-fA-F][0-9a-fA-F])+', 'i') plain,
      array(select (regexp_matches ($1,'((?:%[0-9a-fA-F][0-9a-fA-F])+)', 'gi'))[1]) encoded
    )
    SELECT  string_agg(plain[i] || coalesce( convert_from(decode(replace(encoded[i], '%',''), 'hex'), 'utf8'),''),'')
    FROM STR,
      (SELECT  generate_series(1, array_upper(encoded,1)+2) i FROM STR)blah
    INTO ret;
  EXCEPTION WHEN OTHERS THEN  --'failed: %',url;
    return $1;
  END;
  RETURN coalesce(ret,$1); -- when the string has no encoding;
END;
$$
  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION urldecode(url TEXT,msgEncoding TEXT='utf-8')
RETURNS text
AS
$$
DECLARE
  ret text;
BEGIN
 BEGIN
    WITH STR AS (
      SELECT
      case when $1 ~ '^%[0-9a-fA-F][0-9a-fA-F]'
           then array['']
           end
      || regexp_split_to_array ($1,'(%[0-9a-fA-F][0-9a-fA-F])+', 'i') plain,
      array(select (regexp_matches ($1,'((?:%[0-9a-fA-F][0-9a-fA-F])+)', 'gi'))[1]) encoded
    )
    SELECT  string_agg(plain[i] || coalesce( convert_from(decode(replace(encoded[i], '%',''), 'hex'), msgEncoding),''),'')
    FROM STR,
      (SELECT  generate_series(1, array_upper(encoded,1)+2) i FROM STR)blah
    INTO ret;
  EXCEPTION WHEN OTHERS THEN  --'failed: %',url;
    return $1;
  END;
  RETURN coalesce(ret,$1); -- when the string has no encoding;
END;
$$
  LANGUAGE plpgsql;
