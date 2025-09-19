#!/usr/bin/env python3

import grpc
import profile_service_pb2
import profile_service_pb2_grpc

def run():
    # Создаем канал для подключения к серверу
    with grpc.insecure_channel('localhost:50051') as channel:
        # Создаем stub (клиент)
        stub = profile_service_pb2_grpc.ProfileServiceStub(channel)
        
        # Создаем запрос
        request = profile_service_pb2.ProfileRequest(user_id=123)
        
        # Вызываем метод GetProfile
        print("Клиент вызывает GetProfile...")
        response = stub.GetProfile(request)
        
        # Выводим полученный ответ
        print("Ответ от сервера:")
        print(f"User ID: {response.user_id}")
        print(f"Username: {response.username}")
        print(f"Email: {response.email}")
        print(f"First Name: {response.first_name}")
        print(f"Last Name: {response.last_name}")
        print(f"Age: {response.age}")
        print(f"Bio: {response.bio}")

if __name__ == '__main__':
    run()