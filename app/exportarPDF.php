<?php

$dificultad = $_GET['difc'] ?? null;

// Construir WHERE dinámico
$where = [];
$params = [];

if($dificultad && $dificultad !== 'todas') {
    $idDificultad = obtenerIDByName($conexion, 'dificultades', $dificultad);
 
    if ($dificultad) {
        $where[] = "d.id = ?";
        $params[] = $idDificultad;
    }
}

/**
 * OTRA OPCIÓN
 */
if(!empty($dificultad) && $dificultad !== 'todas') {
    $idDificultad = obtenerIDByName($conexion, 'dificultades', $dificultad);
 
    if ($dificultad) {
        $where[] = "d.id = ?";
        $params[] = $idDificultad;
    }
}
$sql = "
    SELECT 
        p.id,
        u.nombre AS usuario,
        p.puntuacion,
        d.nombre AS dificultad,
        p.fecha
    FROM partidas p
    JOIN users u ON p.id_user = u.id
    JOIN dificultades d ON p.dificultad_id = d.id
";

if (!empty($where)) {
    $sql .= " WHERE " . implode(" AND ", $where);
}

$sql .= " ORDER BY p.puntuacion DESC";

$stmt = $conexion->prepare($sql);
$stmt->execute($params);
$partidas = $stmt->fetchAll(PDO::FETCH_ASSOC);


//////////////////////////////
// Probar esto en la consola

SHOW CREATE TABLE users;
SHOW CREATE TABLE partidas;
SHOW CREATE TABLE dificultades;
// SI devulve utf8mb4 -> NICE
            //latin1 -> BAD

?>