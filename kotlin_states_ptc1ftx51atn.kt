package br.com.exemplo.estados

/**
 * Classe selada Kotlin para representar diferentes estados da aplicação.
 * Classes seladas permitem restringir a hierarquia de classes, garantindo
 * que todas as subclasses estejam definidas no mesmo arquivo.
 */
sealed class Estado {
    
    /**
     * Representa o estado inicial da aplicação.
     */
    object Inicial : Estado()
    
    /**
     * Representa o estado de carregamento (loading).
     */
    object Carregando : Estado()
    
    /**
     * Representa o estado de sucesso com dados.
     * @param dados Os dados carregados com sucesso.
     */
    data class Sucesso(val dados: String) : Estado()
    
    /**
     * Representa o estado de erro com uma mensagem de erro.
     * @param mensagem A mensagem de erro descritiva.
     */
    data class Erro(val mensagem: String) : Estado()
    
    /**
     * Representa o estado vazio (sem dados).
     */
    object Vazio : Estado()
    
    /**
     * Verifica se o estado atual é de sucesso.
     */
    fun isSuccess(): Boolean = this is Sucesso
    
    /**
     * Verifica se o estado atual é um erro.
     */
    fun isError(): Boolean = this is Erro
    
    /**
     * Verifica se o estado atual é de carregamento.
     */
    fun isLoading(): Boolean = this is Carregando
}

// Exemplo de uso da classe selada
fun main() {
    val estados = listOf(
        Estado.Inicial,
        Estado.Carregando,
        Estado.Sucesso("Dados carregados"),
        Estado.Erro("Ocorreu um erro"),
        Estado.Vazio
    )
    
    estados.forEach { estado ->
        when (estado) {
            is Estado.Inicial -> println("Estado: Inicial")
            is Estado.Carregando -> println("Estado: Carregando")
            is Estado.Sucesso -> println("Estado: Sucesso - ${estado.dados}")
            is Estado.Erro -> println("Estado: Erro - ${estado.mensagem}")
            is Estado.Vazio -> println("Estado: Vazio")
        }
    }
}
