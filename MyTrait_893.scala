/**
 * Um trait Scala com métodos abstratos e concretos
 */
trait MyTrait {
  // Método abstrato - deve ser implementado pelas classes que estendem este trait
  def abstractMethod(x: Int): String
  
  // Outro método abstrato
  def anotherAbstractMethod: Int
  
  // Método concreto - já tem implementação
  def concreteMethod(): Unit = {
    println("Este é um método concreto do trait")
  }
  
  // Outro método concreto
  def anotherConcreteMethod(a: String, b: String): String = {
    s"Concatenando: $a e $b"
  }
}

// Exemplo de como usar o trait
class MyClass extends MyTrait {
  def abstractMethod(x: Int): String = {
    s"Implementação do método abstrato com valor: $x"
  }
  
  def anotherAbstractMethod: Int = 42
}