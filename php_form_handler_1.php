<?php
// Проверяем, был ли запрос методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Функция для очистки и валидации данных
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    // Получаем и обрабатываем данные из формы
    $name = $email = $comment = $website = "";
    $name = test_input($_POST["name"]);
    $email = test_input($_POST["email"]);
    $comment = test_input($_POST["comment"]);
    $website = test_input($_POST["website"]);

    // Здесь вы можете добавить дополнительную валидацию

    // Пример сохранения данных в файл
    $filename = "form_data.txt";
    $data = "Имя: $name\n";
    $data .= "Email: $email\n";
    $data .= "Комментарий: $comment\n";
    $data .= "Сайт: $website\n";
    $data .= "-------------------------\n";

    file_put_contents($filename, $data, FILE_APPEND | LOCK_EX);

    echo "<h2>Данные формы успешно обработаны!</h2>";
    echo "<p>Имя: " . $name . "</p>";
    echo "<p>Email: " . $email . "</p>";
    echo "<p>Комментарий: " . $comment . "</p>";
    echo "<p>Сайт: " . $website . "</p>";
} else {
    // Если запрос не POST, перенаправляем обратно на форму или показываем сообщение
    header("Location: form.html"); // Предполагается, что у вас есть файл формы form.html
    exit();
}
?>