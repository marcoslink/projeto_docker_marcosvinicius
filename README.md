#Descrição do Projeto
Este projeto tem como objetivo realizar a análise de dados de importações e exportações, utilizando um banco de dados que contém informações sobre transações comerciais. Através de consultas SQL, este projeto permite a visualização dos totais de importação por ano, possibilitando uma análise mais aprofundada dos dados de comércio exterior.

Tecnologias Utilizadas
Banco de Dados:
MySQL: Utilizado para armazenar e gerenciar os dados de importações e exportações.
Backend:
Node.js: Ambiente de execução JavaScript que permite a criação do servidor para manipulação dos dados.
Express: Framework para Node.js que simplifica o desenvolvimento de APIs.
Frontend:
React: Biblioteca JavaScript para a construção de interfaces de usuário interativas e responsivas.
CSS: Usado para estilizar as páginas e melhorar a experiência do usuário.
Docker: Utilizado para containerizar as aplicações, facilitando a configuração e a implementação em diferentes ambientes.
Estrutura do Projeto
O projeto é organizado em seções para melhor compreensão e manutenção. A estrutura de seções é a seguinte:

1. Instalação
Requisitos:
Node.js (versão 14 ou superior)
MySQL (versão 8 ou superior)
Docker (opcional, para containerizar o ambiente)
Passos para a instalação:
Clonar o repositório:

bash
Copy code
git clone <URL do repositório>
cd <diretório do projeto>
Configuração do Banco de Dados:

Acesse o MySQL:
css
Copy code
mysql -u root -p
Crie o banco de dados db_comex e as tabelas necessárias:
sql
Copy code
CREATE DATABASE db_comex;
USE db_comex;
Execute os scripts de criação de tabelas e inserção de dados para importar as informações de importações e exportações.
Instalar dependências do Backend:

No diretório backend, execute:
Copy code
npm install
Instalar dependências do Frontend:

No diretório frontend, execute:
Copy code
npm install
2. Execução
Iniciando o servidor Backend:
No diretório backend, execute o seguinte comando para iniciar o servidor:
sql
Copy code
npm start
O servidor estará disponível em http://localhost:3001.
Iniciando o servidor Frontend:
No diretório frontend, execute o seguinte comando para iniciar o servidor:
sql
Copy code
npm start
O frontend estará disponível em http://localhost:3000.
Usando Docker (Opcional):
Se preferir usar Docker, siga os passos abaixo para rodar o projeto em containers:

Construir a imagem Docker para o Backend: No diretório backend, execute:

Copy code
docker build -t backend .
Construir a imagem Docker para o Frontend: No diretório frontend, execute:

Copy code
docker build -t frontend .
Rodar os containers: Execute os comandos para rodar o backend e o frontend em containers separados:

arduino
Copy code
docker run -p 3001:3001 backend
docker run -p 3000:3000 frontend
3. Endpoints da API
O backend disponibiliza os seguintes endpoints para consulta dos dados:

GET /importacoes/2022: Retorna o valor total das importações de 2022.
GET /importacoes/2023: Retorna o valor total das importações de 2023.
GET /importacoes/totais: Retorna o valor total de importações de todos os anos.
Exemplo de requisição:

bash
Copy code
curl http://localhost:3001/importacoes/2022
4. Banco de Dados
Estrutura das Tabelas:
O banco de dados db_comex contém as seguintes tabelas principais:

tb_importacao: Contém informações sobre as importações.
tb_exportacao: Contém informações sobre as exportações.
dim_tempo: Contém informações de tempo (como ano).
tb_pais, tb_via, tb_unid: Contêm informações sobre o país, via de transporte e unidade de medida, respectivamente.
Exemplo de Consultas SQL:
Para consultar o total de importações por ano:

sql
Copy code
SELECT SUM(vl_fob) AS total_importacao_2022 FROM tb_importacao WHERE cd_ano = 2022;
Para consultar o total de importações de todos os anos:

sql
Copy code
SELECT SUM(vl_fob) AS total_importacao FROM tb_importacao;
5. Contribuição
Se deseja contribuir para o projeto, siga estas etapas:

Faça um fork do repositório.
Crie uma branch para sua alteração:
css
Copy code
git checkout -b minha-nova-feature
Faça suas alterações e commit:
sql
Copy code
git commit -am "Adiciona nova feature"
Faça push para sua branch:
perl
Copy code
git push origin minha-nova-feature
Abra um pull request no repositório original.
6. Licença
Este projeto está licenciado sob a MIT License.


---

Sinta-se à vontade para personalizar o texto conforme necessário para atender às especificidades do seu projeto!
