<?php

/**
 * Valida una dirección de correo electrónico.
 *
 * @param string $email La dirección de correo electrónico a validar.
 * @return bool True si el correo es válido, false en caso contrario.
 */
function validarEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

