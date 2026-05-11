# Criar um array multidimensional (3x4x5)
array = rand(3, 4, 5)

# Gerar nome aleatório para o arquivo
nome_arquivo = string(randstring(10), ".jld2")

# Salvar o array usando JLD2
using JLD2
save(nome_arquivo, "array", array)

println("Array multidimensional criado com dimensões: ", size(array))
println("Arquivo salvo como: ", nome_arquivo)
