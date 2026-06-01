<?php

$uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/static/img/profile/';

// En el move_uploaded_file:
if(!move_uploaded_file($_FILES['img']['tmp_name'], $uploadDir . $nombreUnicoIMG)) {



///////////////
// CAMBIAR ESTO:
// Actualmente (MAL):
if($imagenAntigua && file_exists("../static/img/".$imagenAntigua)) {
    unlink("../static/img/profile/".$imagenAntigua);
}

// Correcto:
if($imagenAntigua && file_exists($uploadDir . $imagenAntigua)) {
    unlink($uploadDir . $imagenAntigua);
}






/////////////////
// VALIDAR EL TAMAÑO DE LAS IMÁGENES:
$maxSize = 2 * 1024 * 1024; // 2MB
if($_FILES['img']['size'] > $maxSize) {
    $errores[] = "La imagen no puede superar los 2MB.";
}

/* ----------------------------------- */
//          EDITAR PERFIL
/* ----------------------------------- */
if(isset($_POST['userID-img'])) {
    $errores = [];
    $userID = $_POST['userID-img'];
    $imagenAntigua = $_POST['nombreImagenAntigua'];
    $imagenNueva = "";
    $existeImagen = false;

    // Ruta absoluta para evitar problemas con Docker
    $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/../static/img/profile/';

    if(!empty($_FILES['img']['name'])) {
        // Validar tipo
        if(!in_array($_FILES['img']['type'], $imagenesPermitidas)) {
            $errores[] = "La imagen seleccionada no tiene el tipo necesario (jpeg, png, jpg).";
            $mensaje = "<i class='fa-solid fa-person-circle-exclamation'></i> La imagen seleccionada no tiene el tipo necesario (jpeg, png, jpg).";
            $tipo_popup = "err";
        // Validar tamaño (máx. 2MB)
        } elseif($_FILES['img']['size'] > 2 * 1024 * 1024) {
            $errores[] = "La imagen no puede superar los 2MB.";
            $mensaje = "<i class='fa-solid fa-person-circle-exclamation'></i> La imagen no puede superar los 2MB.";
            $tipo_popup = "err";
        } else {
            $imagenNueva = $_FILES['img']['name'];
            $existeImagen = true;
        }
    }

    if(empty($errores)) {
        if($existeImagen) {
            $nombreUnicoIMG = date("Y-m-d") . "_" . uniqid() . "_" . $imagenNueva;
            if(is_uploaded_file($_FILES['img']['tmp_name'])) {
                if(!move_uploaded_file($_FILES['img']['tmp_name'], $uploadDir . $nombreUnicoIMG)) {
                    $errores[] = "Error al mover el archivo al directorio de destino.";
                    $mensaje = "<i class='fa-solid fa-person-circle-exclamation'></i> Error al mover el archivo al directorio de destino.";
                    $tipo_popup = "err";
                }
            } else {
                $errores[] = "No se ha seleccionado ningún archivo, o se ha producido un error.";
                $mensaje = "<i class='fa-solid fa-person-circle-exclamation'></i> No se ha seleccionado ningún archivo, o se ha producido un error.";
                $tipo_popup = "err";
            }
        } else {
            $nombreUnicoIMG = '';
        }

        if(empty($errores)) {
            // Eliminar imagen antigua si existe (ruta corregida)
            if($imagenAntigua && file_exists($uploadDir . $imagenAntigua)) {
                unlink($uploadDir . $imagenAntigua);
            }

            $updateIMG = updateUserImage($conexion, $userID, $nombreUnicoIMG);

            if($updateIMG) {
                $imgActual = $nombreUnicoIMG;
                $mensaje = "<i class='fa-solid fa-person-circle-check'></i> Se ha editado la imagen correctamente.";
                $tipo_popup = "success";
            } else {
                $mensaje = "<i class='fa-solid fa-person-circle-exclamation'></i> Ha ocurrido un error inesperado en el guardado de la imagen, lo sentimos :(.";
                $tipo_popup = "err";
            }
        }
    }
}



/* ----------------------------------- */
//          CREAR    PERFIL
/* ----------------------------------- */
if(isset($_POST['saveChanges'])) {
    $errores = [];
    $nick = $_POST['nick-register'] ?? "";
    $nombre = $_POST['name-register'] ?? "";
    $ape1 = $_POST['ape1-register'] ?? "";
    $ape2 = $_POST['ape2-register'] ?? "";
    $pais = $_POST['pais-register'] ?? "";
    $email = $_POST['email-register'] ?? "";
    $pwd = $_POST['pass-register'] ?? "1111";
    $imagenNueva = "";
    $existeImagen = false;

    // Ruta absoluta
    $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/../static/img/profile/';

    if(!empty($_FILES['img']['name'])) {
        if(!in_array($_FILES['img']['type'], $imagenesPermitidas)) {
            $errores[] = "La imagen seleccionada no tiene el tipo necesario (jpeg, png, jpg).";
            $mensaje = "<i class='fa-solid fa-person-circle-exclamation'></i> La imagen seleccionada no tiene el tipo necesario (jpeg, png, jpg).";
            $tipo_popup = "err";
        } elseif($_FILES['img']['size'] > 2 * 1024 * 1024) {
            $errores[] = "La imagen no puede superar los 2MB.";
            $mensaje = "<i class='fa-solid fa-person-circle-exclamation'></i> La imagen no puede superar los 2MB.";
            $tipo_popup = "err";
        } else {
            $imagenNueva = $_FILES['img']['name'];
            $existeImagen = true;
        }
    }

    if(empty($errores)) {
        if($existeImagen) {
            $nombreUnicoIMG = date("Y-m-d") . "_" . uniqid() . "_" . $imagenNueva;
            if(is_uploaded_file($_FILES['img']['tmp_name'])) {
                if(!move_uploaded_file($_FILES['img']['tmp_name'], $uploadDir . $nombreUnicoIMG)) {
                    $errores[] = "Error al mover el archivo al directorio de destino.";
                    $mensaje = "<i class='fa-solid fa-person-circle-exclamation'></i> Error al mover el archivo al directorio de destino.";
                    $tipo_popup = "err";
                }
            } else {
                $errores[] = "No se ha seleccionado ningún archivo, o se ha producido un error.";
                $mensaje = "<i class='fa-solid fa-person-circle-exclamation'></i> No se ha seleccionado ningún archivo, o se ha producido un error.";
                $tipo_popup = "err";
            }
        } else {
            $nombreUnicoIMG = '';
        }

        if(empty($errores)) {
            $update = createUser($conexion, $nick, $nombre, $ape1, $ape2, $email, $pwd, $pais, $nombreUnicoIMG);
            if($update) {
                $mensaje = "<i class='fa-solid fa-person-circle-check'></i> Se ha registrado el usuario correctamente.";
                $tipo_popup = "success";
            } else {
                $mensaje = "<i class='fa-solid fa-person-circle-exclamation'></i> El nick o el correo ya han sido registrados. Prueba con otros :)";
                $tipo_popup = "err";
            }
        }
    }
}
?>