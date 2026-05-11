<?php
/**
 * Скрипт обработки формы с сохранением данных в файл со случайным именем
 */

// Обработка только POST-запросов
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Получение данных из формы
    $formData = $_POST;
    
    // Генерация случайного имени файла
    $randomName = uniqid('form_', true) . '_' . bin2hex(random_bytes(4));
    $filename = $randomName . '.txt';
    
    // Директория для сохранения файлов
    $uploadDir = __DIR__ . '/uploads/';
    
    // Создание директории, если она не существует
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0755, true);
    }
    
    // Формирование содержимого файла
    $content = "Дата: " . date('Y-m-d H:i:s') . "\n";
    $content .= "IP адрес: " . ($_SERVER['REMOTE_ADDR'] ?? 'unknown') . "\n";
    $content .= "Данные формы:\n";
    $content .= str_repeat('-', 40) . "\n";
    
    foreach ($formData as $key => $value) {
        if (is_array($value)) {
            $content .= "$key: " . implode(', ', $value) . "\n";
        } else {
            $content .= "$key: " . htmlspecialchars($value, ENT_QUOTES, 'UTF-8') . "\n";
        }
    }
    
    // Сохранение данных в файл
    $filepath = $uploadDir . $filename;
    
    if (file_put_contents($filepath, $content)) {
        // Успешное сохранение
        http_response_code(200);
        echo json_encode([
            'success' => true,
            'message' => 'Данные успешно сохранены',
            'filename' => $filename,
            'filepath' => $filepath
        ]);
    } else {
        // Ошибка сохранения
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'message' => 'Ошибка при сохранении данных'
        ]);
    }
} else {
    // Если запрос не POST, показываем форму
    ?>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Форма обратной связи</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #f5f5f5;
            }
            .form-container {
                background: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
            h1 {
                color: #333;
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
            }
            input[type="text"],
            input[type="email"],
            textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 14px;
            }
            textarea {
                height: 120px;
                resize: vertical;
            }
            button {
                background-color: #4CAF50;
                color: white;
                padding: 12px 24px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
            }
            button:hover {
                background-color: #45a049;
            }
            .result {
                margin-top: 20px;
                padding: 15px;
                border-radius: 4px;
                display: none;
            }
            .result.success {
                background-color: #d4edda;
                color: #155724;
                border: 1px solid #c3e6cb;
            }
            .result.error {
                background-color: #f8d7da;
                color: #721c24;
                border: 1px solid #f5c6cb;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Форма обратной связи</h1>
            <form id="contactForm" method="POST" action="">
                <div class="form-group">
                    <label for="name">Имя:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Телефон:</label>
                    <input type="text" id="phone" name="phone">
                </div>
                <div class="form-group">
                    <label for="message">Сообщение:</label>
                    <textarea id="message" name="message" required></textarea>
                </div>
                <button type="submit">Отправить</button>
            </form>
            <div id="result" class="result"></div>
        </div>

        <script>
            document.getElementById('contactForm').addEventListener('submit', function(e) {
                e.preventDefault();
                
                const formData = new FormData(this);
                const resultDiv = document.getElementById('result');
                
                fetch('', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    resultDiv.style.display = 'block';
                    if (data.success) {
                        resultDiv.className = 'result success';
                        resultDiv.innerHTML = '<strong>Успешно!</strong> Данные сохранены в файл: ' + data.filename;
                        document.getElementById('contactForm').reset();
                    } else {
                        resultDiv.className = 'result error';
                        resultDiv.innerHTML = '<strong>Ошибка!</strong> ' + data.message;
                    }
                })
                .catch(error => {
                    resultDiv.style.display = 'block';
                    resultDiv.className = 'result error';
                    resultDiv.innerHTML = '<strong>Ошибка!</strong> Не удалось отправить данные';
                });
            });
        </script>
    </body>
    </html>
    <?php
}
?>
