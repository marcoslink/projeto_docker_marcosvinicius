/*-------------------------------------------------------------------------------------------------------------------------
Disciplina: Business Intelligence 
Autor....: Marcos Vinicius Nunes ferreira dos Santos
Objetivo..: Criação do modelo dimensional comex
Bimestre.: 2 Bimestre 2024
Objeto....: modelo_dimensional_comex.sql

Data Criação...................: 21/10/2024
Data Alteração................. :21/10/2024 nome: rodrigo
Alteração Feita: criação das tabelas.
--------------------------------------------------------------------------------------------------------------------------
Versão 1.0
*/
create database dw_comex;
use dw_comex;


create table if not exists dim_tempo(
	sk_ano VARCHAR(4) not null,
    nm_ano varchar(150) null,
    
    PRIMARY KEY(sk_ano)
);



create table fato_importacao(
	sk_importacao int not null,
    sk_ano VARCHAR(4) not null,
    
    vl_total_importacao_2022 decimal(18,2) not null,
    vl_total_importacao_2023 decimal(18,2) not null,
    vl_total_importacao decimal(18,2) not null,
    
    PRIMARY KEY(sk_importacao),
    FOREIGN KEY(sk_ano) references dim_tempo(sk_ano)
    
);