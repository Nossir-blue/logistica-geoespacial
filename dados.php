<?php
header('Content-Type: application/json');

$host = '127.0.0.1';
$port = 3307; // Porta do MySQL
$db = 'logisticaEspacial';
$user = 'root'; // Seu usuário
$pass = 'Macacosmemordam125-1'; // Sua senha, se existir

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consulta os armazéns
    $stmt = $pdo->query("SELECT nome, ST_AsGeoJSON(localizacao) AS geojson FROM Armazens");
    $armazens = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($armazens);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>
