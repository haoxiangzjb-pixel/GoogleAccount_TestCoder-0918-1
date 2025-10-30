<?php
/**
 * Función para validar un correo electrónico
 * 
 * @param string $email El correo electrónico a validar
 * @return bool True si el correo es válido, false en caso contrario
 */
function validarEmail($email) {
    // Utiliza la función filter_var de PHP para validar el formato del correo
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

// Ejemplo de uso:
// $correo = "ejemplo@dominio.com";
// if (validarEmail($correo)) {
//     echo "El correo es válido.";
// } else {
//     echo "El correo no es válido.";
// }
?>