Create package body om_pkg_task AS
FUNCTION CRIA_TAREFA (Pnome varchar, parea varchar) RETURN INTEGER IS
parea2 varchar(100);
poid integer;
pstatus integer;
BEGIN
 /* se existe um equipe com mesma area */
  parea2:=null;
  poid:=0;
  begin 
   SELECT nome_b1 || '/'||  nome_b2 || '/'|| nome_b3, oid, status
   into parea1, poid, pstatus
   From equipe 
   where (nome_b1 || '/'||  nome_b2 || '/'|| nome_b3) = parea;
exception
   when no_data_found then
     parea2:=-1;
	 poid:=null;
 end;  
 if parea2 is not null and pstatus = 0 THEN
 BEGIN
   insert into tarefa (oid, nome, data_criacao, area, equipe_responsavel ) 
   values (seq2.nextval,pnome, sysdate, parea2, poid );
   
   insert into log (oid, retorno)
   values (seq3.nextval,0);
   
   return 0;
 ELSIF parea2 is not null and pstatus = 1 then
   insert into tarefa (oid, nome, data_criacao, area, equipe_responsavel ) 
   values (seq2.nextval,pnome, sysdate, parea, 0 );
   
   insert into log (oid, retorno)
   values (seq3.nextval,-2);
   
   return -2;
 ELSE

   insert into tarefa (oid, nome, data_criacao, area, equipe_responsavel ) 
   values (seq2.nextval,pnome, sysdate, parea, 0 );
   
   insert into log (oid, retorno)
   values (seq3.nextval,-1);
    
 end;
 commit;
END;