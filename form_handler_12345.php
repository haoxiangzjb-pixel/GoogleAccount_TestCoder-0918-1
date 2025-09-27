<?php
// Обработка формы и сохранение данных в файл

// Указываем путь к файлу для сохранения данных
$dataFile = 'form_data.txt';

// Проверяем, была ли форма отправлена методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Получаем и очищаем данные из формы
    $name = trim($_POST['name'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $message = trim($_POST['message'] ?? '');

    // Проверяем, что обязательные поля заполнены
    if (!empty($name) && !empty($email)) {
        // Форматируем данные для записи
        $entry = date('Y-m-d H:i:s') . " | Имя: $name | Email: $email | Сообщение: $message" . PHP_EOL;

        // Пытаемся записать данные в файл
        if (file_put_contents($dataFile, $entry, FILE_APPEND | LOCK_EX)) {
            echo "Данные успешно сохранены!";
        } else {
            echo "Ошибка при сохранении данных.";
        }
    } else {
        echo "Пожалуйста, заполните все обязательные поля (Имя и Email).";
    }
} else {
    // Если это не POST-запрос, выводим простую форму
    echo '
    <form method="post">
        <label for="name">Имя (обязательно):</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email (обязательно):</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="message">Сообщение:</label><br>
        <textarea id="message" name="message"></textarea><br><br>

        <input type="submit" value="Отправить">
    </form>
    ';
}
?>