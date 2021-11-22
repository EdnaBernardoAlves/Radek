Create PROCEDURE Alimentar_om_record @ptipo NUMERIC , @psubtipo NUMERIC
AS
DECLARE
@nat numeric
BEGIN
set @nat = 0;
Select @nat =o. natureza from tcall c, om_record_natureza o
Where c.tipo = o.tipo
And c.subtipo = o.subtipo
and o.tipo = @ptipo
and o.subtipo = @psubtipo;
 Insert into om_record (oid, tipo, subtipo,natureza,data_criacao) 
values (next value for seq,@ptipo,@psubtipo,@nat,current_timestamp);
END; 
