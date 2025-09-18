# Thrift Order Service

Этот проект реализует сервис обработки заказов с использованием Apache Thrift.

## Структура проекта

- `order_service.thrift` - файл определения интерфейса Thrift
- `generated/` - сгенерированный код для Java и Python
- `order_server.py` - реализация сервера на Python
- `order_client.py` - клиент для тестирования сервиса

## Интерфейс сервиса

Сервис предоставляет следующие методы:

1. `createOrder` - создание нового заказа
2. `getOrder` - получение заказа по ID
3. `updateOrderStatus` - обновление статуса заказа
4. `deleteOrder` - удаление заказа

## Запуск сервиса

1. Установите зависимости:
   ```
   pip install thrift
   ```

2. Запустите сервер:
   ```
   python order_server.py
   ```

3. В другом терминале запустите клиент для тестирования:
   ```
   python order_client.py
   ```

## Генерация кода

Для генерации кода из thrift-файла используются следующие команды:

Java:
```
thrift -gen java:beans -out generated/java order_service.thrift
```

Python:
```
thrift -gen py -out generated/py order_service.thrift
```