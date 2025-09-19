<?php
// Проверяем, была ли отправлена форма
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Получаем данные из формы
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $message = htmlspecialchars($_POST['message']);
    
    // Создаем строку с данными
    $data = "Имя: " . $name . "\n";
    $data .= "Email: " . $email . "\n";
    $data .= "Сообщение: " . $message . "\n";
    $data .= "Дата: " . date("Y-m-d H:i:s") . "\n";
    $data .= "------------------------\n";
    
    // Имя файла для сохранения данных
    $filename = "form_submissions.txt";
    
    // Сохраняем данные в файл
    file_put_contents($filename, $data, FILE_APPEND | LOCK_EX);
    
    // Выводим сообщение об успешной отправке
    echo "<h2>Спасибо за ваше сообщение!</h2>";
    echo "<p>Имя: " . $name . "</p>";
    echo "<p>Email: " . $email . "</p>";
    echo "<p>Сообщение: " . $message . "</p>";
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