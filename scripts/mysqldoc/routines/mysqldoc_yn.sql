drop function mysqldoc_yn;
create function mysqldoc_yn(value varchar(8)) returns varchar(8) deterministic
begin
    declare result VARCHAR(8);
    declare testvalue varchar(8);

    set testvalue = trim(value);

    case testvalue
        when '1' then set result = '&#x2705;';
        when 'YES' then set result = '&#x2705;';
        when 'FULLTEXT' then set result = '&#x2705;';
        else set result = '&#x274C;';
    end case;

    return result;
end;

