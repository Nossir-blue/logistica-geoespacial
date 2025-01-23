<?php
$host = '127.0.0.1';
$port = 3307;
$db = 'logistica';
$user = 'root';
$pass = ''; // Senha em branco para XAMPP

// Conexão com o banco de dados
$conn = new mysqli($host, $user, $pass, $db, $port);

// Verificar a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Função para obter armazéns próximos
function getArmazensProximos($lat, $lon, $raio) {
    global $conn;
    $query = "
        SELECT id, nome, ST_AsText(localizacao) AS localizacao, 
        ST_Distance(localizacao, ST_GeomFromText('POINT($lon $lat)')) AS distancia
        FROM armazens
        WHERE ST_Distance(localizacao, ST_GeomFromText('POINT($lon $lat)')) <= $raio;
    ";
    $result = $conn->query($query);
    $armazens = [];
    while ($row = $result->fetch_assoc()) {
        $armazens[] = $row;
    }
    return $armazens;
}

// Exemplo de uso: Obter armazéns dentro de 10 km de uma coordenada específica
$lat = -8.8100;
$lon = 13.2300;
$armazensProximos = getArmazensProximos($lat, $lon, 10000); // 10 km

echo json_encode($armazensProximos);

$conn->close();
?>
