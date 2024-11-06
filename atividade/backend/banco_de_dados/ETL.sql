/*-------------------------------------------------------------------------------------------------------------------------
Disciplina: Business Intelligence 
Autor....: Marcos Vinicius Nunes ferreira dos Santos
Objetivo..: ETL
Bimestre.: 2 Bimestre 2024
Objeto....: etl_comex.sql

Data Criação...................: 21/10/2024
Data Alteração................. :21/10/2024 nome: Marcos
Alteração Feita: ETL para dados escalares.
--------------------------------------------------------------------------------------------------------------------------
Versão 1.0
*/

use db_comex;

# transformação dimensão tempo
SELECT DISTINCT(cd_ano) AS ano 
FROM tb_importacao
WHERE cd_ano BETWEEN 2022 AND 2023;

#Pergunta:qual o valor total das importações do ano de 2022
select format(SUM(vl_fob),2) AS valor_total_importacao
	from tb_importacao
    WHERE cd_ano =2022;
    
#Pergunta:qual o valor total das importações do ano de 2023
select format(SUM(vl_fob),2) AS valor_total_importacao
	from tb_importacao
    WHERE cd_ano =2023;
    

#Pergunta:qual o valor total das importações de todos os anos
select format(SUM(vl_fob),2) AS valor_total_importacao
	from tb_importacao;
        
    
    
    
    
    
    
    
# ETL.
    
    select format(SUM(vl_fob), 2) as soma_total_vl_fob 
           from tb_importacao
           where cd_ano = 2022
      limit 10;