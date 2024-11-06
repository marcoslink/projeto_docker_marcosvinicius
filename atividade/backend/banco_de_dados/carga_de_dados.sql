/*-------------------------------------------------------------------------------------------------------------------------
Disciplina: Business Intelligence 
Autor....: Marcos Vinicius Nunes Ferreira dos Santos
Objetivo..: carga de dados
Bimestre.: 2 Bimestre 2024
Objeto....: carga de dados.

Data Criação...................: 28/10/2024
Data Alteração................. :28/10/2024 nome: Marcos
Data Alteração................. :28/10/2024 nome: Marcos
Alteração Feita: carga de dados Insert/Select
--------------------------------------------------------------------------------------------------------------------------
Versão 1.0
*/
use db_comex;

/*--------------------------------------------------------------
 carga da dimensão tempo
--------------------------------------------------------------*/

use dw_comex;
#describe FROM dw_comex.dim_tempo;

INSERT INTO dw_comex.dim_tempo (sk_ano, nm_ano)
SELECT DISTINCT 
    cd_ano AS sk_ano,
    CASE 
        WHEN cd_ano = 2022 THEN "dois mil e vinte e dois"
        WHEN cd_ano = 2023 THEN "dois mil e vinte e três"
        ELSE "Ano desconhecido" -- Opcional: para lidar com outros anos, se necessário
    END AS cd_ano
FROM db_comex.tb_importacao
WHERE cd_ano BETWEEN 2022 AND 2023;



