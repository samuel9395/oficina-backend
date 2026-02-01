select * from ordem_servico;

-- Mecânicos disponíveis (não em muitas ordens ativas)
SELECT
    m.*,
    COUNT(em.numero_os) as ordens_ativas
FROM mecanico m
LEFT JOIN equipe_mecanica em ON m.id = em.mecanico_id
LEFT JOIN ordem_servico os ON em.numero_os = os.numero_os
WHERE os.status_execucao IN ('PENDENTE', 'EM_EXECUCAO') OR os.numero_os IS NULL
GROUP BY m.id
ORDER BY ordens_ativas ASC;

-- Equipe de uma ordem de serviço específica
SELECT
    m.nome_mecanico AS "mecanico",
    m.especialidade AS "especialidade",
    os.status_execucao AS "status de execução",
    os.numero_os AS "nº os"
FROM equipe_mecanica em
JOIN mecanico m ON m.id = em.mecanico_id
JOIN ordem_servico os ON os.numero_os = em.numero_os
WHERE os.numero_os = '3';

-- Mecânicos por especialidade
SELECT
    nome_mecanico,
    especialidade,
    COUNT(*) as total_mecanicos
FROM mecanico
GROUP BY especialidade
ORDER BY total_mecanicos DESC;

