<?php
// Обработка формы и сохранение данных в файл

// Указываем путь к файлу для сохранения данных
$logFile = 'form_submissions.txt';

// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Собираем данные из формы
    $formData = [];
    foreach ($_POST as $key => $value) {
        // Экранируем HTML-теги для безопасности
        $formData[$key] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
    }

    // Формируем строку для записи в файл
    $logEntry = date('Y-m-d H:i:s') . " - " . print_r($formData, true) . "\n";

    // Открываем файл для дозаписи и записываем данные
    if (file_put_contents($logFile, $logEntry, FILE_APPEND | LOCK_EX)) {
        echo "Данные формы успешно сохранены в {$logFile}.";
    } else {
        echo "Ошибка при попытке записи в файл {$logFile}.";
    }
} else {
    // Если запрос не POST, выводим сообщение
    echo "Данный скрипт принимает только POST-запросы.";
}
?>