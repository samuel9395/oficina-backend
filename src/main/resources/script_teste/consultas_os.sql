-- RELATÓRIOS

-- Ordens em andamento
SELECT
    os.numero_os AS "nº os",
    os.data_emissao,
    os.status_execucao,
    v.placa,
    v.modelo,
    v.cor,
    c.nome AS cliente
FROM ordem_servico os
JOIN veiculo v ON os.veiculo_id = v.id
JOIN cliente c ON v.cliente_id = c.id
WHERE os.status_execucao IN ('PENDENTE', 'EM_EXECUCAO')
ORDER BY os.data_emissao ASC;

-- Ordens concluídas no mês atual com valor total
SELECT
    os.numero_os,
    os.data_conclusao,
    os.valor_total,
    v.placa,
    c.nome AS cliente
FROM ordem_servico os
JOIN veiculo v ON os.veiculo_id = v.id
JOIN cliente c ON v.cliente_id = c.id
WHERE os.status_execucao = 'CONCLUIDO'
  AND MONTH(os.data_conclusao) = MONTH(CURRENT_DATE())
  AND YEAR(os.data_conclusao) = YEAR(CURRENT_DATE());

-- Valor total faturado por mês
SELECT
    FORMATDATETIME(os.data_conclusao, 'yyyy-MM') AS "mes",
    COUNT(*) AS "total_os",
    -- Converte o resultado da soma para DECIMAL com 10 dígitos no total e 2 decimais
    CAST(SUM(os.valor_total) AS DECIMAL(10, 2)) AS "faturamento"
FROM ordem_servico os
WHERE os.status_execucao = 'CONCLUIDO'
  AND os.data_conclusao IS NOT NULL
GROUP BY "mes"
ORDER BY "mes" DESC;