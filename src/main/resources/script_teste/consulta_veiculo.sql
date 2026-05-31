USE oficina;
SELECT * FROM veiculo;
SELECT * FROM oficina.ordem_servico;
DESC ordem_servico;
SELECT * FROM vw_detalhes_ordem_servico;
SELECT * FROM vw_detalhes_ordem_servico_pendente;
SELECT * FROM vw_detalhes_ordem_servico_concluido;
SELECT * FROM vw_detalhes_ordem_servico_nao_concluido;

CREATE INDEX idx_veiculo_placa ON veiculo(placa);

-- Busca completa por placa
SELECT 
  o.numero_os AS "Ordem de serviço",
  FORMATDATETIME(o.data_emissao, 'dd/MM/yyyy') AS "Data emissão",
  FORMATDATETIME(o.data_conclusao, 'dd/MM/yyyy') AS "Data conclusão",
  o.status_autorizacao AS "Status autorização",
  o.status_execucao AS "Status execução",
  o.valor_total AS "Valor total",
  v.placa AS "Placa",
  v.modelo AS "Modelo",
  v.marca AS "Marca",
  v.cor AS "Cor",
  c.nome AS "Cliente",
  c.telefone AS "Telefone",
  LISTAGG(DISTINCT m.nome_mecanico, ', ') AS "Mecanico",
  LISTAGG(DISTINCT s.tipo_servico, ', ') AS "Servicos realizados",
  LISTAGG(DISTINCT p.nome_peca, ', ') AS "Peças utilizadas"
FROM ordem_servico o
JOIN veiculo v ON o.numero_os = v.id
JOIN cliente c ON v.cliente_id = c.id
LEFT JOIN equipe_mecanica em ON o.numero_os = em.numero_os
LEFT JOIN os_has_servico ohs ON ohs.numero_os = o.numero_os
LEFT JOIN servico s ON s.id = ohs.servico_id
LEFT JOIN mecanico m ON em.mecanico_id = m.id
LEFT JOIN os_has_peca ohp ON ohp.numero_os = o.numero_os
LEFT JOIN peca p ON p.cod_peca = ohp.cod_peca
WHERE v.placa = 'ABC1A07'
GROUP BY
  o.numero_os, o.data_emissao, o.data_conclusao, o.status_autorizacao,
  o.status_execucao, o.valor_total, v.placa, v.modelo, v.marca, v.cor, c.nome, c.telefone;
 -- ------------------------------------------------

-- Histórico completo do veículo
SELECT 
  o.numero_os AS "nº os",
  o.data_emissao AS "data emissão",
  o.data_conclusao AS "data conclusão",
  o.status_execucao AS "status execução",
  o.valor_total AS "valor total",
  GROUP_CONCAT(DISTINCT s.tipo_servico SEPARATOR ', ') AS "servicos realizados",
  GROUP_CONCAT(DISTINCT p.nome_peca SEPARATOR ', ') AS "pecas utilizadas"
FROM ordem_servico o
JOIN veiculo v 
  ON v.id = o.veiculo_id
LEFT JOIN os_has_servico ohs 
  ON ohs.numero_os = o.numero_os
LEFT JOIN servico s 
  ON s.id = ohs.servico_id
LEFT JOIN os_has_peca ohp 
  ON ohp.numero_os = o.numero_os
LEFT JOIN peca p 
  ON p.cod_peca = ohp.cod_peca
WHERE v.placa = 'ABC1A01'
GROUP BY 
  o.numero_os, o.data_emissao, o.data_conclusao, o.status_execucao, o.valor_total
ORDER BY o.data_emissao;
-------------------------------------------------
-- @Query(nativeQuery = true, value = """
--             SELECT\s
--                 o.numero_os AS 'nº os',
--                 o.data_emissao AS 'data emissão',
--                 o.data_conclusao AS 'data conclusão',\s
--                 o.status_execucao AS 'status execução',
--                 o.valor_total AS 'valor total',
--                 v.placa,
--                 v.modelo,
--                 v.marca,
--                 v.cor,
--                 c.nome AS cliente,
--                 c.telefone,
--                 GROUP_CONCAT(DISTINCT m.nome_mecanico SEPARATOR ', ') AS mecanicos,
--                 GROUP_CONCAT(DISTINCT p.nome_peca SEPARATOR ', ') AS pecas_utilizadas
--             FROM ordem_servico o
--             JOIN veiculo v\s
--               ON o.numero_os = v.ordem_servico_id
--             JOIN cliente c\s
--               ON v.id_cliente = c.id_cliente
--             LEFT JOIN equipe_mecanica em\s
--               ON o.numero_os = em.numero_os
--             LEFT JOIN mecanico m\s
--               ON em.id_mecanico = m.id_mecanico
--             LEFT JOIN os_has_peca ohp\s
--               ON ohp.numero_os = o.numero_os
--             LEFT JOIN peca p\s
--               ON p.cod_peca = ohp.cod_peca
--             WHERE v.placa = :placa
--             GROUP BY\s
--               o.numero_os,
--               o.data_emissao,
--               o.data_conclusao,\s
--               o.status_execucao,
--               o.valor_total,
--               v.placa,
--               v.modelo,
--               v.marca,
--               v.cor,
--               c.nome,
--               c.telefone;
--             """)
-- ----------------------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_detalhes_ordem_servico AS
SELECT 
  o.numero_os AS 'Ordem de serviço',
  DATE_FORMAT(o.data_emissao, '%d/%m/%Y') AS 'Data emissão',
  DATE_FORMAT(o.data_conclusao, '%d/%m/%Y') AS 'Data conclusão', 
  o.status_autorizacao AS 'Status autorização',
  o.status_execucao AS 'Status execução',
  o.valor_total AS 'Valor total',
  v.placa AS 'Placa',
  v.modelo AS 'Modelo',
  v.marca AS 'Marca',
  v.cor AS 'Cor',
  c.nome AS 'Cliente',
  c.telefone AS 'Telefone',
  GROUP_CONCAT(DISTINCT m.nome_mecanico SEPARATOR ', ') AS 'Mecanico',
  GROUP_CONCAT(DISTINCT s.tipo_servico SEPARATOR ', ') AS 'Servicos realizados',
  GROUP_CONCAT(DISTINCT p.nome_peca SEPARATOR ', ') AS 'Peças utilizadas'
FROM ordem_servico o
JOIN veiculo v 
  ON o.numero_os = v.ordem_servico_id
JOIN cliente c 
  ON v.id_cliente = c.id_cliente
LEFT JOIN equipe_mecanica em 
  ON o.numero_os = em.numero_os
LEFT JOIN os_has_servico ohs 
  ON ohs.numero_os = o.numero_os
LEFT JOIN servico s 
  ON s.id_servico = ohs.id_servico
LEFT JOIN mecanico m 
  ON em.id_mecanico = m.id_mecanico
LEFT JOIN os_has_peca ohp 
  ON ohp.numero_os = o.numero_os
LEFT JOIN peca p 
  ON p.cod_peca = ohp.cod_peca
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
-- -----------------------------------------------------------
CREATE OR REPLACE VIEW vw_detalhes_ordem_servico_pendente AS
SELECT 
  o.numero_os AS 'Ordem de serviço',
  DATE_FORMAT(o.data_emissao, '%d/%m/%Y') AS 'Data emissão',
  DATE_FORMAT(o.data_conclusao, '%d/%m/%Y') AS 'Data conclusão', 
  o.status_autorizacao AS 'Status autorização',
  o.status_execucao AS 'Status execução',
  o.valor_total AS 'Valor total',
  v.placa AS 'Placa',
  v.modelo AS 'Modelo',
  v.marca AS 'Marca',
  v.cor AS 'Cor',
  c.nome AS 'Cliente',
  c.telefone AS 'Telefone',
  GROUP_CONCAT(DISTINCT m.nome_mecanico SEPARATOR ', ') AS 'Mecanico',
  GROUP_CONCAT(DISTINCT s.tipo_servico SEPARATOR ', ') AS 'Servicos realizados',
  GROUP_CONCAT(DISTINCT p.nome_peca SEPARATOR ', ') AS 'Peças utilizadas'
FROM ordem_servico o
JOIN veiculo v 
  ON o.numero_os = v.ordem_servico_id
JOIN cliente c 
  ON v.id_cliente = c.id_cliente
LEFT JOIN equipe_mecanica em 
  ON o.numero_os = em.numero_os
LEFT JOIN os_has_servico ohs 
  ON ohs.numero_os = o.numero_os
LEFT JOIN servico s 
  ON s.id_servico = ohs.id_servico
LEFT JOIN mecanico m 
  ON em.id_mecanico = m.id_mecanico
LEFT JOIN os_has_peca ohp 
  ON ohp.numero_os = o.numero_os
LEFT JOIN peca p 
  ON p.cod_peca = ohp.cod_peca
WHERE o.status_execucao = 'PENDENTE'
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
-- --------------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_detalhes_ordem_servico_concluido AS
SELECT 
  o.numero_os AS 'Ordem de serviço',
  DATE_FORMAT(o.data_emissao, '%d/%m/%Y') AS 'Data emissão',
  DATE_FORMAT(o.data_conclusao, '%d/%m/%Y') AS 'Data conclusão', 
  o.status_autorizacao AS 'Status autorização',
  o.status_execucao AS 'Status execução',
  o.valor_total AS 'Valor total',
  v.placa AS 'Placa',
  v.modelo AS 'Modelo',
  v.marca AS 'Marca',
  v.cor AS 'Cor',
  c.nome AS 'Cliente',
  c.telefone AS 'Telefone',
  GROUP_CONCAT(DISTINCT m.nome_mecanico SEPARATOR ', ') AS 'Mecanico',
  GROUP_CONCAT(DISTINCT s.tipo_servico SEPARATOR ', ') AS 'Servicos realizados',
  GROUP_CONCAT(DISTINCT p.nome_peca SEPARATOR ', ') AS 'Peças utilizadas'
FROM ordem_servico o
JOIN veiculo v 
  ON o.numero_os = v.ordem_servico_id
JOIN cliente c 
  ON v.id_cliente = c.id_cliente
LEFT JOIN equipe_mecanica em 
  ON o.numero_os = em.numero_os
LEFT JOIN os_has_servico ohs 
  ON ohs.numero_os = o.numero_os
LEFT JOIN servico s 
  ON s.id_servico = ohs.id_servico
LEFT JOIN mecanico m 
  ON em.id_mecanico = m.id_mecanico
LEFT JOIN os_has_peca ohp 
  ON ohp.numero_os = o.numero_os
LEFT JOIN peca p 
  ON p.cod_peca = ohp.cod_peca
WHERE o.status_execucao = 'CONCLUIDO'
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
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_detalhes_ordem_servico_nao_concluido AS
SELECT 
  o.numero_os AS 'Ordem de serviço',
  DATE_FORMAT(o.data_emissao, '%d/%m/%Y') AS 'Data emissão',
  DATE_FORMAT(o.data_conclusao, '%d/%m/%Y') AS 'Data conclusão', 
  o.status_autorizacao AS 'Status autorização',
  o.status_execucao AS 'Status execução',
  o.valor_total AS 'Valor total',
  v.placa AS 'Placa',
  v.modelo AS 'Modelo',
  v.marca AS 'Marca',
  v.cor AS 'Cor',
  c.nome AS 'Cliente',
  c.telefone AS 'Telefone',
  GROUP_CONCAT(DISTINCT m.nome_mecanico SEPARATOR ', ') AS 'Mecanico',
  GROUP_CONCAT(DISTINCT s.tipo_servico SEPARATOR ', ') AS 'Servicos realizados',
  GROUP_CONCAT(DISTINCT p.nome_peca SEPARATOR ', ') AS 'Peças utilizadas'
FROM ordem_servico o
JOIN veiculo v 
  ON o.numero_os = v.ordem_servico_id
JOIN cliente c 
  ON v.id_cliente = c.id_cliente
LEFT JOIN equipe_mecanica em 
  ON o.numero_os = em.numero_os
LEFT JOIN os_has_servico ohs 
  ON ohs.numero_os = o.numero_os
LEFT JOIN servico s 
  ON s.id_servico = ohs.id_servico
LEFT JOIN mecanico m 
  ON em.id_mecanico = m.id_mecanico
LEFT JOIN os_has_peca ohp 
  ON ohp.numero_os = o.numero_os
LEFT JOIN peca p 
  ON p.cod_peca = ohp.cod_peca
WHERE o.status_execucao = 'NAO_CONCLUIDO'
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