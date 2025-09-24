<?php
// Проверяем, была ли форма отправлена методом POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Инициализируем массив для хранения ошибок
    $errors = array();

    // Обработка и валидация поля 'name'
    $name = isset($_POST['name']) ? trim($_POST['name']) : '';
    if (empty($name)) {
        $errors['name'] = "Имя обязательно.";
    } elseif (strlen($name) < 2) {
        $errors['name'] = "Имя должно содержать не менее 2 символов.";
    }

    // Обработка и валидация поля 'email'
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    if (empty($email)) {
        $errors['email'] = "Email обязателен.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = "Некорректный email.";
    }

    // Обработка и валидация поля 'message'
    $message = isset($_POST['message']) ? trim($_POST['message']) : '';
    if (empty($message)) {
        $errors['message'] = "Сообщение обязательно.";
    } elseif (strlen($message) < 10) {
        $errors['message'] = "Сообщение должно содержать не менее 10 символов.";
    }

    // Если ошибок нет, можно обработать данные (например, сохранить в файл)
    if (empty($errors)) {
        // Пример сохранения в файл (можно заменить на сохранение в базу данных)
        $data = "Имя: " . $name . "\n";
        $data .= "Email: " . $email . "\n";
        $data .= "Сообщение: " . $message . "\n";
        $data .= "-------------------------\n";

        file_put_contents('form_data.txt', $data, FILE_APPEND | LOCK_EX);

        // Сообщение об успешной отправке
        $success_message = "Форма успешно отправлена!";
    }
}

// Функция для вывода ошибок
function print_error($field_name) {
    global $errors;
    if (isset($errors[$field_name])) {
        echo '<span style="color: red;">' . $errors[$field_name] . '</span><br>';
    }
}
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Обработка формы</title>
</head>
<body>
    <?php if (isset($success_message)): ?>
        <h2><?php echo $success_message; ?></h2>
    <?php else: ?>
        <h2>Отправьте форму</h2>
        <form method="post" action="">
            <label for="name">Имя:</label><br>
            <input type="text" id="name" name="name" value="<?php echo isset($_POST['name']) ? htmlspecialchars($_POST['name']) : ''; ?>"><br>
            <?php print_error('name'); ?>

            <label for="email">Email:</label><br>
            <input type="text" id="email" name="email" value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>"><br>
            <?php print_error('email'); ?>

            <label for="message">Сообщение:</label><br>
            <textarea id="message" name="message"><?php echo isset($_POST['message']) ? htmlspecialchars($_POST['message']) : ''; ?></textarea><br>
            <?php print_error('message'); ?>

            <input type="submit" value="Отправить">
        </form>
    <?php endif; ?>
</body>
</html>