SELECT * FROM veiculo;

-- Busca completa por placa
SELECT 
  o.numero_os AS 'nº os',
  o.data_emissao AS 'data emissão',
  o.data_conclusao AS 'data conclusão', 
  o.status_execucao AS 'status execução',
  o.valor_total AS 'valor total',
  v.placa,
  v.modelo,
  v.marca,
  v.cor,
  c.nome AS cliente,
  c.telefone,
  GROUP_CONCAT(DISTINCT m.nome_mecanico SEPARATOR ', ') AS mecanicos,
  GROUP_CONCAT(DISTINCT p.nome_peca SEPARATOR ', ') AS pecas_utilizadas
FROM ordem_servico o
JOIN veiculo v 
  ON o.numero_os = v.ordem_servico_id
JOIN cliente c 
  ON v.id_cliente = c.id_cliente
LEFT JOIN equipe_mecanica em 
  ON o.numero_os = em.numero_os
LEFT JOIN mecanico m 
  ON em.id_mecanico = m.id_mecanico
-- JOIN correto das peças
LEFT JOIN os_has_peca ohp 
  ON ohp.numero_os = o.numero_os
LEFT JOIN peca p 
  ON p.cod_peca = ohp.cod_peca
WHERE v.placa = 'ABC1A01'
GROUP BY 
  o.numero_os,
  o.data_emissao,
  o.data_conclusao, 
  o.status_execucao,
  o.valor_total,
  v.placa,
  v.modelo,
  v.marca,
  v.cor,
  c.nome,
  c.telefone;
 -- ------------------------------------------------

-- Histórico completo do veículo
SELECT 
  o.numero_os AS 'nº os',
  o.data_emissao AS 'data emissão',
  o.data_conclusao AS 'data conclusão',
  o.status_execucao AS 'status execução',
  o.valor_total AS 'valor total',
  GROUP_CONCAT(DISTINCT s.tipo_servico SEPARATOR ', ') AS 'servicos realizados',
  GROUP_CONCAT(DISTINCT p.nome_peca SEPARATOR ', ') AS 'pecas utilizadas'
FROM ordem_servico o
JOIN veiculo v 
  ON v.ordem_servico_id = o.numero_os
LEFT JOIN os_has_servico ohs 
  ON ohs.numero_os = o.numero_os
LEFT JOIN servico s 
  ON s.id_servico = ohs.id_servico
LEFT JOIN os_has_peca ohp 
  ON ohp.numero_os = o.numero_os
LEFT JOIN peca p 
  ON p.cod_peca = ohp.cod_peca
WHERE v.placa = 'ABC1A03'
GROUP BY 
  o.numero_os,
  o.data_emissao,
  o.data_conclusao,
  o.status_execucao,
  o.valor_total
ORDER BY o.data_emissao DESC;