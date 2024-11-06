// server.js
const express = require('express');
const cors = require('cors');
const connection = require('./db');

const app = express();
app.use(cors());
app.use(express.json());

// Rota para obter o total de importações do ano de 2022
app.get('/importacoes/2022', (req, res) => {
  connection.query('SELECT FORMAT(SUM(vl_fob), 2) AS valor_total_importacao FROM tb_importacao WHERE cd_ano = 2022', (error, results) => {
      if (error) {
        console.error('Erro ao buscar dados:', error);
        res.status(500).send('Erro ao buscar dados');
      } else {
        res.json(results);
      }
    });
});

// Rota para obter o total de importações do ano de 2023
app.get('/importacoes/2023', (req, res) => {
  connection.query('SELECT FORMAT(SUM(vl_fob), 2) AS valor_total_importacao FROM tb_importacao WHERE cd_ano = 2023', (error, results) => {
      if (error) {
        console.error('Erro ao buscar dados:', error);
        res.status(500).send('Erro ao buscar dados');
      } else {
        res.json(results);
      }
    });
});

// Rota para obter o total de importações de todos os anos
app.get('/importacoes/todos', (req, res) => {
  connection.query('SELECT FORMAT(SUM(vl_fob), 2) AS valor_total_importacao FROM tb_importacao', (error, results) => {
      if (error) {
        console.error('Erro ao buscar dados:', error);
        res.status(500).send('Erro ao buscar dados');
      } else {
        res.json(results);
      }
    });
});

const PORT = 3001;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
