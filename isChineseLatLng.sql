--是否是否是中国范围内常用的经纬度
CREATE OR REPLACE FUNCTION isChineseLatLng(lat TEXT,lng TEXT)
RETURNS boolean
AS
$$
DECLARE
  _lat float;
  _lng float;
BEGIN
  BEGIN
    _lat = lat::float;
    EXCEPTION WHEN others THEN
      RETURN false;
  END;
  BEGIN
    _lng = lng::float;
    EXCEPTION WHEN others THEN
      RETURN false;
  END;
  IF _lat<3.86 OR _lat>53.55 THEN
    RETURN false;
  END IF;
  IF _lng<73.66 OR _lng>135.05 THEN
    RETURN false;
  END IF;
  RETURN true;
END;
$$
LANGUAGE plpgsql;
