import random
import string

def invertir_lista_y_guardar(lista):
    """
    Invierte una lista y la guarda en un archivo con nombre aleatorio.
    
    Args:
        lista (list): La lista a invertir
    
    Returns:
        str: El nombre del archivo donde se guardó la lista invertida
    """
    # Invertir la lista
    lista_invertida = lista[::-1]
    
    # Generar un nombre de archivo aleatorio
    nombre_archivo = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.txt'
    
    # Guardar la lista invertida en el archivo
    with open(nombre_archivo, 'w') as f:
        for item in lista_invertida:
            f.write(str(item) + '\n')
    
    return nombre_archivo

# Ejemplo de uso
if __name__ == "__main__":
    mi_lista = [1, 2, 3, 4, 5]
    archivo_guardado = invertir_lista_y_guardar(mi_lista)
    print(f"Lista original: {mi_lista}")
    print(f"Lista invertida guardada en: {archivo_guardado}")