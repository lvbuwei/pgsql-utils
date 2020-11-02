--分割字符串到一个json对象
CREATE OR REPLACE FUNCTION split_to_json(Names TEXT,Str TEXT,Sep TEXT=E'\\|')
RETURNS jsonb
AS
$$
BEGIN
RETURN json_object(regexp_split_to_array(Names,Sep),regexp_split_to_array(Str,Sep));
END;
$$
LANGUAGE plpgsql;
