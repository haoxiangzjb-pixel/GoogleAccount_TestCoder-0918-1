sealed class Estado<out T> {
    object Iniciando : Estado<Nothing>()
    object Carregando : Estado<Nothing>()
    data class Sucesso<T>(val dados: T) : Estado<T>()
    data class Erro(val mensagem: String) : Estado<Nothing>()
}

fun main() {
    val estado1: Estado<String> = Estado.Iniciando
    val estado2: Estado<String> = Estado.Carregando
    val estado3: Estado<String> = Estado.Sucesso("Dados carregados!")
    val estado4: Estado<String> = Estado.Erro("Algo deu errado")

    listOf(estado1, estado2, estado3, estado4).forEach { estado ->
        when (estado) {
            is Estado.Iniciando -> println("Estado: Iniciando")
            is Estado.Carregando -> println("Estado: Carregando")
            is Estado.Sucesso -> println("Estado: Sucesso - ${estado.dados}")
            is Estado.Erro -> println("Estado: Erro - ${estado.mensagem}")
        }
    }
}
