import numpy as np
import random
import string

# Criar um array multidimensional (3x4x5)
array = np.random.rand(3, 4, 5)

# Gerar nome aleatório para o arquivo
nome_aleatorio = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
nome_arquivo = f"{nome_aleatorio}.npy"

# Salvar o array
np.save(nome_arquivo, array)

print(f"Array multidimensional criado com dimensões: {array.shape}")
print(f"Arquivo salvo como: {nome_arquivo}")
