-- =====================
-- CLIENTE
-- =====================
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('João Silva',12345678901,'Rua das Flores, 123','11990000001');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Maria Oliveira',23456789012,'Av. Paulista, 1000','11990000002');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Carlos Santos',34567890123,'Rua São João, 456','11990000003');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Ana Pereira',45678901234,'Rua do Comércio, 89','11990000004');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Pedro Almeida',56789012345,'Av. Brasil, 321','11990000005');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Fernanda Costa',67890123456,'Rua das Acácias, 77','11990000006');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Lucas Rodrigues',78901234567,'Rua Independência, 555','11990000007');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Juliana Martins',89012345678,'Av. Central, 900','11990000008');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Rafael Lima',90123456789,'Rua Bela Vista, 42','11990000009');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Camila Azevedo',10234567890,'Rua Monte Verde, 210','11990000010');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Bruno Fernandes',11223344556,'Rua dos Pinheiros, 333','11991111111');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Patricia Mendes',22334455667,'Av. das Nações, 777','11992222222');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Roberto Nunes',33445566778,'Rua XV de Novembro, 150','11993333333');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Sandra Alves',44556677889,'Rua das Palmeiras, 80','11994444444');
INSERT INTO cliente (nome, cpf, endereco, telefone) VALUES ('Diego Costa',55667788990,'Av. Rio Branco, 650','11995555555');

-- =====================
-- VEICULO
-- =====================
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Toyota','Corolla','Prata','ABC1A01','2018-01-01',85000,1);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Honda','Civic','Preto','ABC1A02','2019-01-01',72000,2);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Ford','Focus','Branco','ABC1A03','2017-01-01',90000,3);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Chevrolet','Onix','Vermelho','ABC1A04','2020-01-01',40000,4);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('VW','Golf','Azul','ABC1A05','2016-01-01',98000,5);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Fiat','Argo','Cinza','ABC1A06','2021-01-01',30000,6);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Hyundai','HB20','Branco','ABC1A07','2019-01-01',60000,7);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Renault','Sandero','Prata','ABC1A08','2018-01-01',75000,8);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Nissan','Versa','Preto','ABC1A09','2020-01-01',50000,9);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Peugeot','208','Azul','ABC1A10','2021-01-01',28000,10);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Jeep','Renegade','Verde','XYZ2B11','2020-01-01',45000,11);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('BMW','320i','Preto','XYZ2B12','2021-01-01',25000,12);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Mercedes','Classe A','Branco','XYZ2B13','2022-01-01',15000,13);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Audi','A3','Cinza','XYZ2B14','2019-01-01',68000,14);
INSERT INTO veiculo (marca, modelo, cor, placa, ano_fabricacao, kilometragem, cliente_id) VALUES ('Volvo','XC40','Azul','XYZ2B15','2020-01-01',52000,15);

-- =====================
-- MECANICO
-- =====================
INSERT INTO mecanico (nome_mecanico, end_mecanico, especialidade, tel_mecanico) VALUES ('Carlos Pereira','Rua Mecânica, 100','Motor',1198000001);
INSERT INTO mecanico (nome_mecanico, end_mecanico, especialidade, tel_mecanico) VALUES ('Marcos Silva','Rua Oficina, 200','Suspensão',1198000002);
INSERT INTO mecanico (nome_mecanico, end_mecanico, especialidade, tel_mecanico) VALUES ('Eduardo Lima','Rua Auto Center, 300','Elétrica',1198000003);
INSERT INTO mecanico (nome_mecanico, end_mecanico, especialidade, tel_mecanico) VALUES ('Ricardo Santos','Rua das Engrenagens, 55','Freios',1198000004);
INSERT INTO mecanico (nome_mecanico, end_mecanico, especialidade, tel_mecanico) VALUES ('Fábio Oliveira','Rua dos Motores, 88','Injeção Eletrônica',1198000005);
INSERT INTO mecanico (nome_mecanico, end_mecanico, especialidade, tel_mecanico) VALUES ('André Costa','Av. das Oficinas, 123','Ar Condicionado',1198000006);
INSERT INTO mecanico (nome_mecanico, end_mecanico, especialidade, tel_mecanico) VALUES ('Sérgio Ramos','Rua do Mecânico, 77','Transmissão',1198000007);

-- =====================
-- ORDEM_SERVICO
-- =====================
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-10','2026-01-11',280.00,'NAO_AUTORIZADO','PENDENTE', 1);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-11','2026-01-12',120.00,'AUTORIZADO','EM_EXECUCAO', 2);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-12','2026-01-13',200.00,'AUTORIZADO','EM_EXECUCAO', 3);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-13','2026-01-14',290.00,'AUTORIZADO','CONCLUIDO', 4);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-14','2026-01-15',300.00,'AUTORIZADO','CONCLUIDO', 5);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-15','2026-01-16',280.00,'NAO_AUTORIZADO','PENDENTE', 6);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-16','2026-01-17',120.00,'NAO_AUTORIZADO','PENDENTE', 7);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-17','2026-01-18',200.00,'AUTORIZADO','PENDENTE', 8);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-18','2026-01-19',450.00,'AUTORIZADO','EM_EXECUCAO', 9);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-19','2026-01-20',150.00,'AUTORIZADO','PENDENTE', 10);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-20','2026-01-21',780.00,'AUTORIZADO','CONCLUIDO', 11);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-21','2026-01-22',180.00,'AUTORIZADO','EM_EXECUCAO', 12);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-22','2026-01-23',810.00,'AUTORIZADO','CONCLUIDO', 13);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-23','2026-01-24',520.00,'NAO_AUTORIZADO','PENDENTE', 14);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-24','2026-01-25',190.00,'AUTORIZADO','EM_EXECUCAO', 15);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-25','2026-01-26',705.00,'AUTORIZADO','CONCLUIDO', 1);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-26','2026-01-27',150.00,'NAO_AUTORIZADO','PENDENTE', 2);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-27','2026-01-28',400.00,'AUTORIZADO','EM_EXECUCAO', 3);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-28','2026-01-29',720.00,'AUTORIZADO','CONCLUIDO', 4);
INSERT INTO ordem_servico (data_emissao, data_conclusao, valor_total, status_autorizacao, status_execucao, veiculo_id) VALUES ('2026-01-29','2026-01-30',330.00,'AUTORIZADO','PENDENTE', 5);

-- =====================
-- PECA
-- =====================
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Filtro de óleo',40.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Óleo 5W30',90.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Pastilha de freio',150.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Bateria 60Ah',450.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Velas de Ignição', 120.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Correia Dentada', 180.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Radiador', 350.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Amortecedor Dianteiro', 280.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Disco de Freio', 220.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Sensor de Oxigênio', 190.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Filtro de Ar', 65.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Lâmpada Farol', 85.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Bobina de Ignição', 250.00);
INSERT INTO peca (nome_peca, valor_peca) VALUES ('Junta do Cabeçote', 95.00);

-- =====================
-- SERVICO
-- =====================
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Troca de óleo',150.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Alinhamento',120.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Balanceamento',100.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Revisão elétrica',200.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Troca de Correia Dentada', 180.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Troca de Amortecedores', 300.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Revisão Completa 40k km', 450.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Troca de Discos e Pastilhas', 280.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Diagnóstico Eletrônico', 120.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Higienização de Ar Condicionado', 150.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Troca de Velas', 90.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Balanceamento e Alinhamento', 200.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Troca de Bateria', 80.00);
INSERT INTO servico (tipo_servico, valor_servico) VALUES ('Revisão de Suspensão', 220.00);

-- =====================
-- EQUIPE_MECANICA
-- =====================
INSERT INTO equipe_mecanica (numero_os, mecanico_id) VALUES (1,1),(2,2),(3,3),(4,1),(5,2);
INSERT INTO equipe_mecanica (numero_os, mecanico_id) VALUES (6,3),(7,3),(8,1),(9,2),(10,1);
INSERT INTO equipe_mecanica (numero_os, mecanico_id) VALUES (11,1),(11,4),(12,2),(12,5),(13,3);
INSERT INTO equipe_mecanica (numero_os, mecanico_id) VALUES (13,6),(14,4),(14,7),(15,5),(15,1);
INSERT INTO equipe_mecanica (numero_os, mecanico_id) VALUES (16,6),(16,2),(17,7),(17,3),(18,1);
INSERT INTO equipe_mecanica (numero_os, mecanico_id) VALUES (18,4),(19,2),(19,5),(20,3),(20,6);

-- =====================
-- OS_HAS_PECA
-- =====================
INSERT INTO os_has_peca (numero_os, cod_peca) VALUES (1,1),(2,1),(3,2),(4,2),(5,3);
INSERT INTO os_has_peca (numero_os, cod_peca) VALUES (6,4),(7,3),(8,3),(9,4),(10,4);
INSERT INTO os_has_peca (numero_os, cod_peca) VALUES (11,5),(11,6),(12,7),(12,8),(13,9);
INSERT INTO os_has_peca (numero_os, cod_peca) VALUES (13,10),(14,5),(14,7),(15,8),(15,9);
INSERT INTO os_has_peca (numero_os, cod_peca) VALUES (16,10),(16,11),(17,12),(17,13),(18,14);
INSERT INTO os_has_peca (numero_os, cod_peca) VALUES (18,1),(19,2),(19,3),(20,4),(20,5);

-- =====================
-- OS_HAS_SERVICO
-- =====================
INSERT INTO os_has_servico (numero_os, servico_id) VALUES (1,1),(1,2),(2,2),(3,4),(4,4);
INSERT INTO os_has_servico (numero_os, servico_id) VALUES (5,1),(6,1),(7,2),(8,4),(9,4);
INSERT INTO os_has_servico (numero_os, servico_id) VALUES (10,1),(11,5),(11,6),(12,7),(13,8);
INSERT INTO os_has_servico (numero_os, servico_id) VALUES (13,9),(14,10),(15,5),(15,6),(16,7);
INSERT INTO os_has_servico (numero_os, servico_id) VALUES (17,8),(18,9),(18,10),(19,5),(19,6);
INSERT INTO os_has_servico (numero_os, servico_id) VALUES (20,7),(20,8);