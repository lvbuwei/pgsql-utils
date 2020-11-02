-- Base58编码 将大整数编成字母数字混合格式
-- SELECT * FROM base58(333333);
CREATE OR REPLACE FUNCTION base58(IN num bigint, OUT result text) AS $$
DECLARE
	alphabet char[] := ARRAY['1','2','3','4','5','6','7','8','9','A','B','C',
	'D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W',
	'X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','m','n','o','p',
	'q','r','s','t','u','v','w','x','y','z'];
BEGIN
	result := '';
	WHILE num != 0 LOOP
		result := alphabet[(num % 58)+1] || result;
		num := num / 58;
	END LOOP;
END;
$$ LANGUAGE PLPGSQL;
