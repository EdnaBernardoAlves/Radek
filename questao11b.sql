create table tarefa (
oid integer primary key,
nome varchar(100),
data_criacao date,
area numeric,
equipe_responsavel integer,
constraint fk_tarefa FOREIGN key (equipe_responsavel) references equipe (oid))