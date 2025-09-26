<?php
// Обработка формы и сохранение данных в файл

// Проверяем, была ли форма отправлена методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $message = $_POST['message'] ?? '';

    // Простая валидация (проверка на пустоту)
    if (empty($name) || empty($email) || empty($message)) {
        die("Все поля обязательны для заполнения.");
    }

    // Формируем строку данных для записи
    $data = "Имя: " . $name . "\n";
    $data .= "Email: " . $email . "\n";
    $data .= "Сообщение: " . $message . "\n";
    $data .= "Дата отправки: " . date('Y-m-d H:i:s') . "\n";
    $data .= "--------------------------\n";

    // Генерируем случайное имя файла
    $random_filename = 'form_data_' . bin2hex(random_bytes(8)) . '.txt';

    // Сохраняем данные в файл
    $result = file_put_contents($random_filename, $data, FILE_APPEND | LOCK_EX);

    if ($result === false) {
        die("Ошибка при сохранении данных в файл.");
    }

    echo "Данные успешно сохранены в файл: " . $random_filename;
} else {
    // Если форма не была отправлена, выводим сообщение
    echo "Доступ запрещен.";
}
?>