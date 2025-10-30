// Definindo um enum para demonstrar o uso de match
enum Status {
    Concluido,
    Pendente,
    Erro(String),
    Processando { passo: u32, total: u32 },
}

// Função que usa match para lidar com diferentes valores do enum
fn tratar_status(status: Status) -> String {
    match status {
        Status::Concluido => "Tarefa concluída com sucesso!".to_string(),
        Status::Pendente => "Aguardando processamento...".to_string(),
        Status::Erro(mensagem) => format!("Ocorreu um erro: {}", mensagem),
        Status::Processando { passo, total } => {
            format!("Processando... {} de {}", passo, total)
        }
    }
}

fn main() {
    // Exemplos de uso do enum com diferentes variantes
    let status1 = Status::Concluido;
    let status2 = Status::Pendente;
    let status3 = Status::Erro("Conexão falhou".to_string());
    let status4 = Status::Processando { passo: 3, total: 10 };

    let resultado1 = tratar_status(status1);
    let resultado2 = tratar_status(status2);
    let resultado3 = tratar_status(status3);
    let resultado4 = tratar_status(status4);

    let conteudo_saida = format!(
        "Status 1: {}\nStatus 2: {}\nStatus 3: {}\nStatus 4: {}\n",
        resultado1, resultado2, resultado3, resultado4
    );

    // Salvando em um arquivo com nome aleatório
    use std::fs::File;
    use std::io::Write;
    
    // Gerando um nome aleatório para o arquivo
    let nome_arquivo = format!("saida_{}.txt", gerar_nome_aleatorio());
    let mut arquivo = File::create(&nome_arquivo).expect("Não foi possível criar o arquivo");
    arquivo.write_all(conteudo_saida.as_bytes()).expect("Não foi possível escrever no arquivo");
    
    println!("Conteúdo salvo no arquivo: {}", nome_arquivo);
}

// Função simples para gerar um nome aleatório (usando timestamp como base)
fn gerar_nome_aleatorio() -> String {
    use std::time::{SystemTime, UNIX_EPOCH};
    let tempo = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .expect("Erro ao obter timestamp")
        .as_secs();
    format!("{:x}", tempo) // Convertendo para hexadecimal como forma simples de "aleatoriedade"
}