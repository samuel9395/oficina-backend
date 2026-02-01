use oficina;

show tables;

select * from cliente;
select * from veiculo;

-- Todos os clientes com seus veículos
SELECT
    c.nome AS cliente,
    c.telefone,
    v.placa,
    v.marca,
    v.modelo
FROM cliente c
LEFT JOIN veiculo v ON c.id = v.cliente_id
ORDER BY c.nome;

SELECT
    c.nome,
    c.telefone,
    v.placa,
    v.marca,
    v.modelo
FROM cliente c
LEFT JOIN veiculo v ON c.id = v.cliente_id
WHERE UPPER(c.nome) LIKE UPPER(CONCAT('C', '%'))
ORDER BY c.nome;

-- Clientes que mais utilizam o serviço (top 10)
SELECT
    c.nome,
    COUNT(os.numero_os) as total_os
FROM cliente c
JOIN veiculo v ON c.id = v.cliente_id
JOIN ordem_servico os ON os.veiculo_id = v.id
GROUP BY c.id, c.nome
ORDER BY total_os DESC
LIMIT 10;