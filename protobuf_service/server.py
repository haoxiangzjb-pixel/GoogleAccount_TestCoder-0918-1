#!/usr/bin/env python3

import grpc
from concurrent import futures
import time
import profile_service_pb2
import profile_service_pb2_grpc

# Реализация сервиса
class ProfileServiceServicer(profile_service_pb2_grpc.ProfileServiceServicer):
    def GetProfile(self, request, context):
        # В реальной реализации здесь был бы запрос к базе данных
        # Для демонстрации просто возвращаем фиктивные данные
        print(f"Получен запрос на профиль для user_id: {request.user_id}")
        
        # Создаем фиктивный профиль
        profile = profile_service_pb2.ProfileResponse(
            user_id=request.user_id,
            username=f"user_{request.user_id}",
            email=f"user{request.user_id}@example.com",
            first_name="Иван",
            last_name="Иванов",
            age=30,
            bio="Это демонстрационный профиль"
        )
        
        return profile

def serve():
    # Создаем сервер gRPC
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    
    # Добавляем наш сервис к серверу
    profile_service_pb2_grpc.add_ProfileServiceServicer_to_server(
        ProfileServiceServicer(), server)
    
    # Привязываем сервер к порту
    server.add_insecure_port('[::]:50051')
    print("Сервер запущен на порту 50051...")
    
    # Запускаем сервер
    server.start()
    
    try:
        # Держим сервер активным
        while True:
            time.sleep(86400)  # Спим сутки
    except KeyboardInterrupt:
        print("Остановка сервера...")
        server.stop(0)

if __name__ == '__main__':
    serve()