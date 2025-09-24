<?php
// Проверяем, был ли запрос отправлен методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Пример обработки данных формы
    // Предположим, форма имеет поля 'name' и 'email'
    $name = $_POST['name'] ?? 'Не указано';
    $email = $_POST['email'] ?? 'Не указано';

    // Здесь можно добавить валидацию и очистку данных
    $name = htmlspecialchars($name);
    $email = htmlspecialchars($email);

    // Пример сохранения в файл или базу данных
    $log_entry = date('Y-m-d H:i:s') . " - Имя: $name, Email: $email\n";
    file_put_contents('form_submissions.log', $log_entry, FILE_APPEND | LOCK_EX);

    echo "Спасибо, $name! Ваши данные ($email) были получены и обработаны.";
} else {
    // Если это не POST-запрос, возможно, форма не была отправлена
    echo "Данные формы не были отправлены.";
}
?>