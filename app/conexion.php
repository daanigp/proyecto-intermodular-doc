<?php
////////////////////////////////////////////
// AÑADIR Esto  $conexion->exec("SET NAMES utf8mb4");
require_once 'configuracion.php';

function conectarDB() {
    try {
        $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;    
        $conexion = new PDO($dsn, DB_USER, DB_PASS, [
                            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
                        ]);
        //ESSTA LINEA
        $conexion->exec("SET NAMES utf8mb4");
    } catch (PDOException $e) {
        die('Error de conexión con la base de datos: ' . $e->getMessage());
    }

    return $conexion;
}


///--------------------
// EN main.css
// Poner tamaño para la imagen del HEADER
?>