--SELECT is_email('test.@domain.com');
CREATE OR REPLACE FUNCTION isemail(email text)
RETURNS boolean
AS
$$
BEGIN
    return regexp_match($1, $REGEXP$
^
(?<![-!#$%&'*+/=?^_`{|}~@."\]\\a-zA-Zа-яА-ЯёЁ\d])
(?:
    [-!#$%&'*+/=?^_`{|}~a-zA-Z\d]+
  | "(?:(?:[^"\\]|\\.)+)"
)
(?:
  \.
  (?:
      [-!#$%&'*+/=?^_`{|}~a-zA-Z\d]+
    | "(?:[^"\\]|\\.)+"
  )
)*
@
(?:
    (?:
       (?:
         (?!-)
         (?:
             (?:[a-zA-Z\d]|-(?!-)){1,63}
         )
         (?<!-)
         \.
       )+
       (?:
           [a-zA-Z]{2,63}
       )
    )\M
  | (?: #IPv4
      (?<!\d)
      (?!0+\.)
      (?:1?\d\d?|2(?:[0-4]\d|5[0-5]))(?:\.(?:1?\d\d?|2(?:[0-4]\d|5[0-5]))){3}
      (?!\d)
    )
  | \[
    (?:
      (?<!\d)
      (?!0+\.)
      (?:1?\d\d?|2(?:[0-4]\d|5[0-5]))(?:\.(?:1?\d\d?|2(?:[0-4]\d|5[0-5]))){3}
      (?!\d)
    )
    \]
)
$
$REGEXP$, 'sx') is not null;
END;
$$
LANGUAGE plpgsql;
