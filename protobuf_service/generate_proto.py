#!/usr/bin/env python3

import grpc_tools.protoc
import os

# Получаем абсолютный путь к директории скрипта
script_dir = os.path.dirname(os.path.abspath(__file__))

# Путь к .proto файлу
proto_file = os.path.join(script_dir, "profile_service.proto")

# Генерируем Python-код из .proto файла
# Мы будем генерировать как _pb2.py файлы для сообщений, так и _pb2_grpc.py для сервисов
grpc_tools.protoc.main([
    'grpc_tools.protoc',
    f'-I{script_dir}',
    f'--python_out={script_dir}',
    f'--grpc_python_out={script_dir}',
    proto_file
])

print(f"Сгенерированы Python-файлы из {proto_file}")