import toml
import datetime
import random
import string

# Gerar um nome de arquivo aleatório
def generate_random_filename():
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.toml"

# Criar dados para o arquivo TOML com datetime
data = {
    "configuration": {
        "timestamp": datetime.datetime.now().isoformat()
    }
}

# Gerar nome aleatório para o arquivo
filename = generate_random_filename()

# Escrever o arquivo TOML
with open(filename, 'w') as f:
    toml.dump(data, f)

print(f"Arquivo TOML criado: {filename}")
print(f"Conteúdo do arquivo:\n{toml.dumps(data)}")