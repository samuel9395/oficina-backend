-- RELATÓRIOS

-- Serviços mais realizados
SELECT
    s.tipo_servico,
    COUNT(*) AS total_realizado,
    CAST(AVG(os.valor_total) AS DECIMAL(10, 2)) AS valor_medio
FROM servico s
JOIN os_has_servico ohs ON s.id = ohs.servico_id
JOIN ordem_servico os ON os.numero_os = ohs.numero_os
WHERE os.status_execucao = 'CONCLUIDO'
GROUP BY s.id, s.tipo_servico
ORDER BY total_realizado DESC;

----------------------------------------

-- Faturamento detalhado por OS
SELECT
    os.numero_os AS "nº os",
    -- Serviços detalhados
    COALESCE(
        (SELECT GROUP_CONCAT(
            CONCAT(s.tipo_servico, ' (R$', CAST(s.valor_servico AS DECIMAL(10, 2)), ')')
            ORDER BY s.tipo_servico SEPARATOR ', '
        ) FROM os_has_servico ohs
        JOIN servico s ON ohs.servico_id = s.id
        WHERE ohs.numero_os = os.numero_os),
        'Sem serviços'
    ) AS "serviços (valor unitário)",

    -- Peças detalhadas
    COALESCE(
        (SELECT GROUP_CONCAT(
            CONCAT(p.nome_peca, ' (R$', CAST(p.valor_peca AS DECIMAL(10, 2)), ')')
            ORDER BY p.nome_peca SEPARATOR ', '
        ) FROM os_has_peca ohp
        JOIN peca p ON ohp.cod_peca = p.cod_peca
        WHERE ohp.numero_os = os.numero_os),
        'Sem peças'
    ) AS "peças (valor unitário)",

    -- Cálculos de totais (uma única vez)
    CAST(COALESCE((SELECT SUM(s.valor_servico)
                   FROM os_has_servico ohs
                   JOIN servico s ON ohs.servico_id = s.id
                   WHERE ohs.numero_os = os.numero_os), 0)
         AS DECIMAL(10, 2)) AS "total serviços",

    CAST(COALESCE((SELECT SUM(p.valor_peca)
                   FROM os_has_peca ohp
                   JOIN peca p ON ohp.cod_peca = p.cod_peca
                   WHERE ohp.numero_os = os.numero_os), 0)
         AS DECIMAL(10, 2)) AS "total peças",

    os.data_conclusao AS "data conclusão",
    CAST(os.valor_total AS DECIMAL(10, 2)) AS "valor total registrado",

    CAST(
        COALESCE((SELECT SUM(s.valor_servico)
                  FROM os_has_servico ohs
                  JOIN servico s ON ohs.servico_id = s.id
                  WHERE ohs.numero_os = os.numero_os), 0) +
        COALESCE((SELECT SUM(p.valor_peca)
                  FROM os_has_peca ohp
                  JOIN peca p ON ohp.cod_peca = p.cod_peca
                  WHERE ohp.numero_os = os.numero_os), 0)
        AS DECIMAL(10, 2)
    ) AS "valor total calculado",

    CAST(
        os.valor_total - (
            COALESCE((SELECT SUM(s.valor_servico)
                      FROM os_has_servico ohs
                      JOIN servico s ON ohs.servico_id = s.id
                      WHERE ohs.numero_os = os.numero_os), 0) +
            COALESCE((SELECT SUM(p.valor_peca)
                      FROM os_has_peca ohp
                      JOIN peca p ON ohp.cod_peca = p.cod_peca
                      WHERE ohp.numero_os = os.numero_os), 0)
        )
        AS DECIMAL(10, 2)
    ) AS "diferença"

FROM ordem_servico os
WHERE os.status_execucao = 'CONCLUIDO'
  AND os.data_conclusao BETWEEN '2026-01-10' AND '2026-01-30'
ORDER BY os.numero_os;