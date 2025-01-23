CREATE DATABASE LogisticaEspacial;
USE LogisticaEspacial;

-- Tabela de Armazéns
CREATE TABLE Armazens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    localizacao POINT NOT NULL,
    SPATIAL INDEX (localizacao)
);

-- Tabela de Pontos de Entrega
CREATE TABLE PontosEntrega (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255),
    localizacao POINT NOT NULL,
    SPATIAL INDEX (localizacao)
);

-- Tabela de Rotas dos Veículos
CREATE TABLE RotasVeiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255),
    rota LINESTRING NOT NULL,
    SPATIAL INDEX (rota)
);
-- Inserir Armazéns
INSERT INTO Armazens (nome, localizacao) 
VALUES 
    ('Armazém 1', ST_GeomFromText('POINT(13.2343 -8.839)')),
    ('Armazém 2', ST_GeomFromText('POINT(13.2654 -8.845)')),
    ('Armazém 3', ST_GeomFromText('POINT(13.312 -8.895)'));

-- Inserir Pontos de Entrega
INSERT INTO PontosEntrega (descricao, localizacao) 
VALUES 
    ('Entrega 1', ST_GeomFromText('POINT(13.2444 -8.837)')),
    ('Entrega 2', ST_GeomFromText('POINT(13.267 -8.860)')),
    ('Entrega 3', ST_GeomFromText('POINT(13.320 -8.890)'));

-- Inserir Rotas dos Veículos
INSERT INTO RotasVeiculos (descricao, rota) 
VALUES 
    ('Rota 1', ST_GeomFromText('LINESTRING(13.2343 -8.839, 13.2654 -8.845, 13.312 -8.895)')),
    ('Rota 2', ST_GeomFromText('LINESTRING(13.2444 -8.837, 13.267 -8.860, 13.320 -8.890)'));
-- Consultar armazens mais próximos
SET @pontoReferencia = ST_GeomFromText('POINT(13.250 -8.850)');

SELECT 
    nome, 
    ST_Distance_Sphere(localizacao, @pontoReferencia) AS distancia
FROM 
    Armazens
WHERE 
    ST_Distance_Sphere(localizacao, @pontoReferencia) <= 10000
ORDER BY distancia;

-- Calcular distância entre dois pontos
SELECT 
    ST_Distance_Sphere(
        (SELECT localizacao FROM PontosEntrega WHERE id = 1),
        (SELECT localizacao FROM PontosEntrega WHERE id = 2)
    ) AS distancia;
-- Visualizar dados no mapa
SELECT 
    id, 
    nome, 
    ST_AsGeoJSON(localizacao) AS geojson 
FROM 
    Armazens;
-- Visualizar rotas no mapa
SELECT 
    id, 
    descricao, 
    ST_AsGeoJSON(rota) AS geojson 
FROM 
    RotasVeiculos;
