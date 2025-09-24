<?php
// Обработка формы и сохранение данных в файл

// Проверяем, был ли отправлен POST-запрос
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Собираем данные из формы
    $formData = [];
    foreach ($_POST as $key => $value) {
        // Экранируем HTML-символы для безопасности
        $formData[$key] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
    }

    // Формируем строку данных для записи в файл
    $logEntry = date('Y-m-d H:i:s') . " - " . print_r($formData, true) . "\n";

    // Генерируем случайное имя файла
    $randomFileName = 'form_data_' . uniqid() . '.log';

    // Открываем файл для записи (или создаем его)
    $fileHandle = fopen($randomFileName, 'a');

    // Записываем данные в файл
    fwrite($fileHandle, $logEntry);

    // Закрываем файл
    fclose($fileHandle);

    // Возвращаем сообщение об успешной обработке
    echo "Данные формы успешно обработаны и сохранены в файл: " . $randomFileName;
} else {
    // Если это не POST-запрос, возвращаем ошибку
    http_response_code(405);
    echo "Метод не разрешен. Используйте POST.";
}
?>