Create TRIGGER tg_tcall 
on tcall
for INSERT
AS
BEGIN
DECLARE
@ptipo numeric,
@psubtipo numeric;
select @ptipo = tipo from inserted;
SELECT @psubtipo = subtipo from inserted;
exec Alimentar_om_record @ptipo, @psubtipo;
END;