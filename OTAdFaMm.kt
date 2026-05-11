// Representação de estados usando uma classe selada em Kotlin
sealed class Estado {
    object Iniciando : Estado()
    object Carregando : Estado()
    data class Sucesso(val dados: String) : Estado()
    data class Erro(val mensagem: String) : Estado()
}

fun main() {
    val estados: List<Estado> = listOf(
        Estado.Iniciando,
        Estado.Carregando,
        Estado.Sucesso("Dados carregados com sucesso!"),
        Estado.Erro("Falha na conexão")
    )

    estados.forEach { estado ->
        when (estado) {
            is Estado.Iniciando -> println("Estado: Iniciando")
            is Estado.Carregando -> println("Estado: Carregando")
            is Estado.Sucesso -> println("Estado: Sucesso - ${estado.dados}")
            is Estado.Erro -> println("Estado: Erro - ${estado.mensagem}")
        }
    }
}
