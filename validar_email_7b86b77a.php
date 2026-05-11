<?php

/**
 * Valida un correo electrónico.
 *
 * @param string $email El correo electrónico a validar.
 * @return bool true si el correo es válido, false en caso contrario.
 */
function validarEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

