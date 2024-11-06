create database db_comex;
/*
Disciplina:Business Intelligence
Autor...: Marcos V N F dos Santos
Objetivo..:Criar a modelagem fisica atraves da modelagem logica dos dados
Bimestre..:2 Bimestre,2024
Objeto....: create_table_modelagem_fisica_comex.sql

Data criação: 07/10/2024
Data alteração: 07/10/2024
Alteração feita:.............:

versão: 1.0

*/
use db_comex;
/*
--utilizando o banco de dados criado.
*/

/*--------------------------------
criação da tabela unidade
----------------------------------*/
CREATE TABLE tb_unid (
id_unid INT NOT NULL PRIMARY KEY,
cd_unid INT NOT NULL,
nm_ncm VARCHAR(400) NOT NULL
);

/*--------------------------------
criação da tabela pais
----------------------------------*/
CREATE TABLE tb_pais (
id_pais INT NOT NULL PRIMARY KEY,
nm_ncm VARCHAR(400) NOT NULL
);

/*--------------------------------
criação da tabela via
----------------------------------*/
CREATE TABLE tb_via (
id_via INT NOT NULL PRIMARY KEY,
nm_via VARCHAR(150) NOT NULL
);


/*--------------------------------
criação da tabela unidade da receita federal
----------------------------------*/
CREATE TABLE tb_urf (
id_urf INT NOT NULL PRIMARY KEY,
nm_urf VARCHAR(150) NOT NULL
);

/*--------------------------------
criação da tabela nomenclatura comun do mercosul
----------------------------------*/
CREATE TABLE tb_ncm (
id_ncm INT NOT NULL PRIMARY KEY,
id_unid INT NOT NULL,
nm_ncm VARCHAR(400) NOT NULL,

FOREIGN KEY(id_unid) REFERENCES tb_unid(id_unid)

);

/*--------------------------------
criação da tabela importação
----------------------------------*/
 CREATE TABLE tb_importacao(
id_importacao INT NOT NULL PRIMARY KEY auto_increment,
id_ncm INT NOT NULL,
id_unid INT NOT NULL,
id_pais INT NOT NULL,
id_via INT NOT NULL,
id_urf INT NOT NULL,
aa_ano VARCHAR(4) NOT NULL,
nm_mes VARCHAR(2),
cd_pais TINYINT NOT NULL,
sg_uf_ncm VARCHAR(2) NOT NULL,
qt_estat DECIMAL(12,2) NOT NULL,
kg_liquido DECIMAL(12,2) NOT NULL,
vl_fob DECIMAL(18,2) NOT NULL,
vl_frete DECIMAL(18,2) NOT NULL,
vl_seguro DECIMAL(18,2) NOT NULL,

FOREIGN KEY(id_ncm) REFERENCES tb_ncm(id_ncm),
FOREIGN KEY(id_unid) REFERENCES tb_unid(id_unid),
FOREIGN KEY(id_pais) REFERENCES tb_pais(id_pais),
FOREIGN KEY(id_via) REFERENCES tb_via(id_via),
FOREIGN KEY(id_urf) REFERENCES tb_urf(id_urf)

);
/*--------------------------------
criação da tabela exportação
----------------------------------*/
CREATE TABLE tb_exportacao(
id_exportacao INT NOT NULL PRIMARY KEY auto_increment,
id_ncm INT NOT NULL,
id_unid INT NOT NULL,
id_pais INT NOT NULL,
id_via INT NOT NULL,
id_urf INT NOT NULL,
aa_ano VARCHAR(4) NOT NULL,
nm_mes VARCHAR(2),
cd_pais TINYINT NOT NULL,
sg_uf_ncm VARCHAR(2) NOT NULL,
qt_estat DECIMAL(12,2) NOT NULL,
kg_liquido DECIMAL(12,2) NOT NULL,
vl_fob DECIMAL(18,2) NOT NULL,


FOREIGN KEY(id_ncm) REFERENCES tb_ncm(id_ncm),
FOREIGN KEY(id_unid) REFERENCES tb_unid(id_unid),
FOREIGN KEY(id_pais) REFERENCES tb_pais(id_pais),
FOREIGN KEY(id_via) REFERENCES tb_via(id_via),
FOREIGN KEY(id_urf) REFERENCES tb_urf(id_urf)

);

SHOW CREATE TABLE tb_pais;


