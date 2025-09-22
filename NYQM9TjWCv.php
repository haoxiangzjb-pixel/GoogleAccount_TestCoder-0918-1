<?php
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Собираем данные из формы
    $name = htmlspecialchars(trim($_POST['name']));
    $email = htmlspecialchars(trim($_POST['email']));
    $message = htmlspecialchars(trim($_POST['message']));

    // Валидация данных (простой пример)
    if (empty($name) || empty($email) || empty($message)) {
        echo "Ошибка: Все поля обязательны для заполнения.";
        exit;
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Ошибка: Неверный формат email.";
        exit;
    }

    // Здесь можно добавить код для сохранения данных, например, в файл или базу данных
    // Пример: сохранение в текстовый файл
    $data = "Имя: $name\nEmail: $email\nСообщение: $message\n\n";
    file_put_contents('form_submissions.txt', $data, FILE_APPEND | LOCK_EX);

    // Выводим сообщение об успешной отправке
    echo "Спасибо, $name! Ваше сообщение успешно отправлено.";

} else {
    // Если форма не была отправлена, показываем форму
    echo '
    <!DOCTYPE html>
    <html>
    <head>
        <title>Форма обратной связи</title>
        <meta charset="UTF-8">
    </head>
    <body>
        <h2>Форма обратной связи</h2>
        <form method="post" action="">
            <label for="name">Имя:</label><br>
            <input type="text" id="name" name="name" required><br><br>
            
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" required><br><br>
            
            <label for="message">Сообщение:</label><br>
            <textarea id="message" name="message" rows="5" cols="40" required></textarea><br><br>
            
            <input type="submit" value="Отправить">
        </form>
    </body>
    </html>
    ';
}
?>