-- Criar a base de dados
CREATE DATABASE IF NOT EXISTS logistica;

-- Selecionar a base de dados
USE logistica;

-- Criar tabela de Armazéns
CREATE TABLE IF NOT EXISTS armazens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    localizacao POINT NOT NULL,
    CONSTRAINT chk_localizacao CHECK (ST_IsValid(localizacao))
);

-- Criar tabela de Pontos de Entrega
CREATE TABLE IF NOT EXISTS pontos_entrega (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    localizacao POINT NOT NULL,
    CONSTRAINT chk_localizacao CHECK (ST_IsValid(localizacao))
);

-- Criar tabela de Rotas de Veículos
CREATE TABLE IF NOT EXISTS rotas_veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_veiculo VARCHAR(255) NOT NULL,
    rota LINESTRING NOT NULL,
    CONSTRAINT chk_rota CHECK (ST_IsValid(rota))
);

-- Inserir alguns dados de exemplo para Armazéns
INSERT INTO armazens (nome, localizacao)
VALUES 
('Armazém 1', ST_GeomFromText('POINT(13.2302 -8.8113)')), -- Exemplo em Luanda
('Armazém 2', ST_GeomFromText('POINT(13.2350 -8.8100)'));

-- Inserir alguns dados de exemplo para Pontos de Entrega
INSERT INTO pontos_entrega (nome, localizacao)
VALUES
('Entrega 1', ST_GeomFromText('POINT(13.2400 -8.8050)')),
('Entrega 2', ST_GeomFromText('POINT(13.2450 -8.8025)'));

-- Inserir dados de exemplo para Rotas de Veículos
INSERT INTO rotas_veiculos (nome_veiculo, rota)
VALUES
('Veículo 1', ST_GeomFromText('LINESTRING(13.2302 -8.8113, 13.2350 -8.8100)')),
('Veículo 2', ST_GeomFromText('LINESTRING(13.2400 -8.8050, 13.2450 -8.8025)'));
-- Encontrar armazéns dentro de um raio de 10 km de um ponto fornecido (por exemplo, 13.2300 -8.8100)
SELECT id, nome, ST_AsText(localizacao) AS localizacao, 
    ST_Distance(localizacao, ST_GeomFromText('POINT(13.2300 -8.8100)')) AS distancia
FROM armazens
WHERE ST_Distance(localizacao, ST_GeomFromText('POINT(13.2300 -8.8100)')) <= 10000; -- 10 km
-- Calcular a distância entre dois armazéns (exemplo entre id = 1 e id = 2)
SELECT 
    a1.nome AS armazem1, 
    a2.nome AS armazem2, 
    ST_Distance(a1.localizacao, a2.localizacao) AS distancia
FROM armazens a1, armazens a2
WHERE a1.id = 1 AND a2.id = 2;
-- Exibir as rotas de veículos
SELECT nome_veiculo, ST_AsText(rota) AS rota
FROM rotas_veiculos;
