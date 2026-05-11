using Random

# Gerar nome aleatório para o arquivo
random_name = join(rand(['a':'z'; 'A':'Z'; '0':'9'], 10))
filename = random_name * ".txt"

# Criar array multidimensional (3x4x5)
array_multidimensional = rand(3, 4, 5)

println("Array criado com dimensões: ", size(array_multidimensional))
println("Nome do arquivo: ", filename)

# Salvar o array como texto
open(filename, "w") do f
    write(f, string(array_multidimensional))
end

println("Array salvo com sucesso em: ", filename)
