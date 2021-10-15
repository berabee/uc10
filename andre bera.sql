create database fifa_andre;

use fifa_andre;

create table estadio (
idestadio integer primary key,
descricao varchar(30),
localizacao varchar(30),
capacidade integer
);

create table grupo (
idgrupo varchar (1) primary key,
descricao varchar (30)
);

create table pais (
IDpais integer primary key,
selecao varchar (30),
continente varchar (30),
tecnico varchar (30),
pontos integer,
vitorias integer,
empates integer,
derrotas integer,
golspro integer,
golscontra integer,
grupo_idgrupo varchar (1),
constraint fk_pais_2 foreign key (grupo_idgrupo) references grupo (idgrupo)
);

create table jogos(
IDrodada integer primary key,
datajogo timestamp,
estadio_idestadio integer,
pais_idpais_1 integer,
pais_idpais_2 integer,
gols_idpais_1 integer,
gols_idpais_2 integer,
publico integer,
constraint fk_jogos_2 foreign key (pais_idpais_1) references pais(idpais),
constraint fk_jogos_3 foreign key (pais_idpais_2) references pais(idpais),
constraint fk_jogos_4 foreign key (estadio_idestadio) references estadio(idestadio)

);

create table jogador (
IDjogador integer primary key,
nome varchar (30),
camisa integer,
posicao varchar(30),
pais_idpais integer,
situacao varchar (30),
constraint fk_jogador_1 foreign key (pais_idpais) references pais(idpais)
);

create table gols(
jogos_idrodada integer primary key,
jogador_idjogador integer,
tempo varchar (30),
constraint fk_gols_1 foreign key (jogador_idjogador) references jogador(idjogador)
);

create table cartao (
jogos_idrodada integer primary key,
jogador_idjogador integer,
amarelo boolean,
vermelho boolean,
tempo varchar (30),
constraint fk_cartao_1 foreign key (jogador_idjogador) references jogador(idjogador)

);

create table subtituicao (
jogador_idrodada integer primary key,
jogador_idjogador_sai integer,
jogador_idjogador_entra integer,
tempo varchar (30),
constraint fk_rod_sub foreign key (jogador_idjogador_sai) references jogador(idjogador),
constraint fk_jog_sub foreign key (jogador_idjogador_entra) references jogador(idjogador)
);	

