<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Пример обработки данных формы
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';

    // Простая валидация (пример)
    if (!empty($name) && !empty($email)) {
        // Здесь можно добавить логику сохранения в базу данных или файл
        $data = "Имя: " . $name . "\nEmail: " . $email . "\n---\n";

        // Сохраняем в файл
        file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);

        echo "Данные успешно сохранены.";
    } else {
        echo "Пожалуйста, заполните все поля.";
    }
} else {
    echo "Доступ запрещен.";
}
?>