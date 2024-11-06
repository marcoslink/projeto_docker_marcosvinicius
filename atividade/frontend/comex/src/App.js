import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './styles.css';

const Exportacoes = () => {
    const [valores, setValores] = useState({ 2022: null, 2023: null, todos: null });
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response2022 = await axios.get('http://localhost:3001/importacoes/2022');
                const response2023 = await axios.get('http://localhost:3001/importacoes/2023');
                const responseTodos = await axios.get('http://localhost:3001/importacoes/todos');

                setValores({
                    2022: response2022.data[0]?.valor_total_importacao || '0,00',
                    2023: response2023.data[0]?.valor_total_importacao || '0,00',
                    todos: responseTodos.data[0]?.valor_total_importacao || '0,00',
                });
            } catch (err) {
                setError('Erro ao buscar dados');
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, []);

    if (loading) return <div>Carregando...</div>;
    if (error) return <div>{error}</div>;

    return (
        <div className="container">
            <h1>Valores Totais de Importação</h1>
            <table>
                <thead>
                    <tr>
                        <th>Ano</th>
                        <th>Valor</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2022</td>
                        <td>R$ {valores[2022]}</td>
                    </tr>
                    <tr>
                        <td>2023</td>
                        <td>R$ {valores[2023]}</td>
                    </tr>
                    <tr>
                        <td>Todas as Importações</td>
                        <td>R$ {valores.todos}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    );
};

export default Exportacoes;
