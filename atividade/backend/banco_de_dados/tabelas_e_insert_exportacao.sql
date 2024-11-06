/*-------------------------------------------------------------------------------------------------------------------------
Disciplina: Business Intelligence 
Autor....: Marcos Vinicius Nunes Ferreira dos Santos
Objetivo..: Criação do modelo dimensional comex
Bimestre.: 2 Bimestre 2024
Objeto....: modelo_dimensional_comex.sql

Data Criação...................: 2/11/2024
Data Alteração................. :2/11/2024 nome: Marcos
Alteração Feita: criação das tabelas e carga de dados Insert/Select.
--------------------------------------------------------------------------------------------------------------------------
Versão 1.0
*/


#create database dw_comex;
use dw_comex;

-- Criação das tabelas de dimensão
CREATE TABLE Dim_NCM (
    sk_ncm INT NOT NULL,
    nk_ncm INT NOT NULL,
    PRIMARY KEY (sk_ncm)
);

CREATE TABLE Dim_unidade (
    sk_unidade INT NOT NULL,
    nk_unidade INT NOT NULL,
    nm_unidade VARCHAR(400),
    PRIMARY KEY (sk_unidade)
);

CREATE TABLE Dim_pais (
    sk_pais INT NOT NULL,
    nk_pais INT NOT NULL,
    nm_pais VARCHAR(400),
    PRIMARY KEY (sk_pais)
);

CREATE TABLE Dim_via (
    sk_via INT NOT NULL,
    nk_via INT NOT NULL,
    nm_via VARCHAR(400),
    PRIMARY KEY (sk_via)
);

create table if not exists Dim_tempo (
    sk_ano VARCHAR(4) NOT NULL,
    nm_ano varchar(150) null,
    PRIMARY KEY (sk_ano)
);

-- Criação da tabela fato_exportacao com chaves estrangeiras

USE dw_comex;

-- Inserir dados na tabela Dim_NCM
INSERT INTO Dim_NCM (sk_ncm, nk_ncm)
SELECT id_ncm, id_ncm
FROM db_comex.tb_ncm;

-- Inserir dados na tabela Dim_unidade
-- `nm_ncm` de `tb_unid` para preencher `nm_unidade`
INSERT INTO Dim_unidade (sk_unidade, nk_unidade, nm_unidade)
SELECT id_unid, id_unid, nm_ncm
FROM db_comex.tb_unid;

-- Inserir dados na tabela Dim_pais
-- `nm_ncm` de `tb_pais` para preencher `nm_pais`
INSERT INTO Dim_pais (sk_pais, nk_pais, nm_pais)
SELECT id_pais, id_pais, nm_pais
FROM db_comex.tb_pais;

-- Inserir dados na tabela Dim_via
-- `nm_via` de `tb_via` para preencher `nm_via`
INSERT INTO Dim_via (sk_via, nk_via, nm_via)
SELECT id_via, id_via, nm_via
FROM db_comex.tb_via;

CREATE TABLE fato_exportacao (
    sk_exportacao INT NOT NULL ,
    
    sk_ncm INT NOT NULL,
    nk_ncm INT NOT NULL,
    
    sk_unidade INT NOT NULL,
    nk_unidade INT NOT NULL,
    
    sk_pais INT NOT NULL,
    nk_pais INT NOT NULL,
    
    sk_via INT NOT NULL,
    nk_via INT NOT NULL,
    
    sk_ano VARCHAR(4) NOT NULL,
    
    PRIMARY KEY (sk_exportacao),
    
    FOREIGN KEY (sk_ncm) REFERENCES Dim_NCM (sk_ncm),
    FOREIGN KEY (sk_unidade) REFERENCES Dim_unidade (sk_unidade),
    FOREIGN KEY (sk_pais) REFERENCES Dim_pais (sk_pais),
    FOREIGN KEY (sk_via) REFERENCES Dim_via (sk_via),
    FOREIGN KEY (sk_ano) REFERENCES Dim_tempo (sk_ano)
);





USE dw_comex;

INSERT INTO fato_exportacao (
    sk_exportacao,
    sk_ncm,
    nk_ncm,
    sk_unidade,
    nk_unidade,
    sk_pais,
    nk_pais,
    sk_via,
    nk_via,
    sk_ano
)
SELECT 
    ROW_NUMBER() OVER (ORDER BY e.id_exportacao) AS sk_exportacao,
    n.sk_ncm,
    n.nk_ncm,
    u.sk_unidade,
    u.nk_unidade,
    p.sk_pais,
    p.nk_pais,
    v.sk_via,
    v.nk_via,
    t.sk_ano
FROM 
    db_comex.tb_exportacao e
JOIN 
    Dim_NCM n ON e.id_ncm = n.nk_ncm
JOIN 
    Dim_unidade u ON e.id_unid = u.nk_unidade
JOIN 
    Dim_pais p ON e.id_pais = p.nk_pais
JOIN 
    Dim_via v ON e.id_via = v.nk_via
JOIN 
    Dim_tempo t ON e.cd_ano = t.sk_ano
    LIMIT 100;




