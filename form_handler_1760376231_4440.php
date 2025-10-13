<?php
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Пример обработки данных из полей 'name' и 'email'
    // Экранируем данные для предотвращения XSS
    $name = htmlspecialchars($_POST['name'] ?? '');
    $email = htmlspecialchars($_POST['email'] ?? '');

    // Выводим полученные данные
    echo "<h1>Данные формы</h1>";
    echo "<p><strong>Имя:</strong> " . $name . "</p>";
    echo "<p><strong>Email:</strong> " . $email . "</p>";
} else {
    // Если данные не отправлены методом POST, выводим сообщение
    echo "<p>Данные формы не были отправлены методом POST.</p>";
}
?>