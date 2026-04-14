import random
import string
import json


def invertir_lista_y_guardar(lista):
    """
    Invierte una lista y la guarda en un archivo con nombre aleatorio.
    
    Args:
        lista: La lista a invertir
        
    Returns:
        str: El nombre del archivo creado
    """
    # Invertir la lista
    lista_invertida = lista[::-1]
    
    # Generar nombre de archivo aleatorio
    nombre_aleatorio = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    nombre_archivo = f"{nombre_aleatorio}.json"
    
    # Guardar la lista invertida en el archivo
    with open(nombre_archivo, 'w') as f:
        json.dump(lista_invertida, f)
    
    return nombre_archivo


# Ejemplo de uso
if __name__ == "__main__":
    mi_lista = [1, 2, 3, 4, 5]
    archivo_creado = invertir_lista_y_guardar(mi_lista)
    print(f"Lista original: {mi_lista}")
    print(f"Archivo creado: {archivo_creado}")
