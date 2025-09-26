<?php
// Проверяем, был ли метод POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Пример обработки данных формы
    $name = $_POST['name'] ?? 'Не указано';
    $email = $_POST['email'] ?? 'Не указано';

    // Экранируем HTML для безопасности
    $name = htmlspecialchars($name, ENT_QUOTES, 'UTF-8');
    $email = htmlspecialchars($email, ENT_QUOTES, 'UTF-8');

    echo "<h1>Данные формы:</h1>";
    echo "<p><strong>Имя:</strong> {$name}</p>";
    echo "<p><strong>Email:</strong> {$email}</p>";
} else {
    // Если метод не POST, выводим простую форму для тестирования
    echo '
    <form method="post">
        <label for="name">Имя:</label><br>
        <input type="text" id="name" name="name"><br><br>
        
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email"><br><br>
        
        <input type="submit" value="Отправить">
    </form>
    ';
}
?>