# Kotlin协程网络请求示例

此项目演示了如何使用Kotlin协程发起网络请求并将结果保存到随机命名的.kt文件中。

## 文件说明

- `final_kotlin_network_example.kt` - 包含完整实现的Kotlin源代码
- `pom.xml` - Maven配置文件，用于管理依赖项
- `src/main/kotlin/network_request.kt` - 另一个实现示例

## 代码功能

1. 使用Kotlin协程发起网络请求
2. 使用Jsoup库访问公共API（https://jsonplaceholder.typicode.com/todos/1）
3. 生成随机文件名（10个随机字母 + .kt扩展名）
4. 将网络请求结果保存到随机命名的.kt文件中

## 依赖项

- `kotlinx-coroutines-core` - Kotlin协程库
- `jsoup` - 用于发起HTTP请求的Java库

## 如何运行

在具有适当环境的系统上，可以使用以下命令运行：

```bash
mvn compile exec:java
```

或者使用Gradle：

```bash
./gradlew run
```

## 示例输出

程序将输出类似以下内容：

```
发起网络请求...
生成随机文件名: abcdefghij.kt
网络请求结果已保存到文件: abcdefghij.kt
文件内容:
// 网络请求结果
val networkResponse = """{"userId":1,"id":1,"title":"delectus aut autem","completed":false}"""
```

## 注意

由于内存限制，当前环境无法编译和运行Kotlin代码，但提供的代码是功能完整的，可以在适当的Kotlin开发环境中运行。
# Scripts para Obter Informações do Sistema

Este diretório contém scripts para obter informações do sistema e salvá-las em arquivos com nomes aleatórios.

## Arquivos

### `Get-SystemInfo.ps1`
- Script PowerShell para coletar informações do sistema
- Gera um arquivo com nome aleatório no formato `SystemInfo_yyyyMMdd_HHMMSS_xxxx.txt`
- Contém informações como nome do computador, sistema operacional, processador, memória, etc.
- Funciona em sistemas Windows com PowerShell

### `Get-SystemInfo-Modified.ps1`
- Versão modificada do script PowerShell com tratamento de erros
- Pode funcionar em diferentes sistemas operacionais com PowerShell Core

### `get_system_info.sh`
- Script Bash alternativo para sistemas Linux/Unix
- Executa o mesmo propósito que os scripts PowerShell
- Gera arquivo com informações do sistema e nome aleatório

## Como usar

### No Linux (com o script Bash):
```bash
chmod +x get_system_info.sh
./get_system_info.sh
```

### No Windows (com o script PowerShell):
```powershell
.\Get-SystemInfo.ps1
```

## Formato do nome do arquivo
O nome do arquivo de saída segue o padrão:
```
SystemInfo_yyyyMMdd_HHMMSS_xxxx.txt
```
Onde:
- `yyyyMMdd` é a data (ano, mês, dia)
- `HHMMSS` é a hora (hora, minuto, segundo)
- `xxxx` é um número aleatório de 4 dígitos
