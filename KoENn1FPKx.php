<?php
// Проверяем, была ли отправлена форма
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Получаем данные из формы
    $name = isset($_POST["name"]) ? htmlspecialchars(trim($_POST["name"])) : "";
    $email = isset($_POST["email"]) ? htmlspecialchars(trim($_POST["email"])) : "";
    
    // Валидация данных (простая проверка)
    if (empty($name) || empty($email)) {
        echo "Пожалуйста, заполните все поля.";
        exit;
    }
    
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Пожалуйста, введите корректный email.";
        exit;
    }
    
    // Подготавливаем данные для сохранения
    $data = "Имя: $name\nEmail: $email\nДата: " . date("Y-m-d H:i:s") . "\n---\n";
    
    // Сохраняем данные в файл
    $file = "form_submissions.txt";
    if (file_put_contents($file, $data, FILE_APPEND | LOCK_EX)) {
        echo "Данные успешно сохранены!";
    } else {
        echo "Ошибка при сохранении данных.";
    }
} else {
    echo "Метод запроса не поддерживается.";
}
?>
