<?php
// Обработка формы и сохранение данных в файл

// Указываем директорию для сохранения файлов
$uploadDir = __DIR__ . '/uploads/';

// Создаем директорию, если она не существует
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0755, true);
}

// Проверяем, была ли форма отправлена методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';

    // Простая валидация (можно расширить)
    if (!empty($name) && !empty($email)) {
        // Генерируем уникальное имя файла
        $fileName = $uploadDir . uniqid('form_data_', true) . '.txt';
        
        // Подготавливаем данные для записи
        $data = "Имя: " . $name . "\n";
        $data .= "Email: " . $email . "\n";
        $data .= "Дата отправки: " . date('Y-m-d H:i:s') . "\n\n";

        // Сохраняем данные в файл
        if (file_put_contents($fileName, $data)) {
            echo "Данные успешно сохранены в файл: " . basename($fileName);
        } else {
            echo "Ошибка при сохранении файла.";
        }
    } else {
        echo "Пожалуйста, заполните все поля формы.";
    }
} else {
    // Отображаем форму, если она не была отправлена
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Форма для отправки данных</title>
    </head>
    <body>
        <h2>Форма обратной связи</h2>
        <form method="post">
            <label for="name">Имя:</label><br>
            <input type="text" id="name" name="name" required><br><br>
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>
            <input type="submit" value="Отправить">
        </form>
    </body>
    </html>
    <?php
}
?>