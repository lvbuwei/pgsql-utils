--转换json到pg数组
CREATE OR REPLACE FUNCTION pya2pga(pya TEXT)
RETURNS TEXT
AS
$$
BEGIN
  RETURN array_agg(trim(value::text,'"'))
  FROM jsonb_array_elements(pya::jsonb)
  WHERE length(trim(value::text,'"'))>0;
END;
$$
LANGUAGE plpgsql;
