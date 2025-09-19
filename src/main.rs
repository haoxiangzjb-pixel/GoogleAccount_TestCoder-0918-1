use rand::Rng;
use std::fs::File;
use std::io::Write;

// Определение структуры пользователя
#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

impl User {
    fn new(name: String, age: u32) -> User {
        User { name, age }
    }
}

fn main() {
    // Создание экземпляра пользователя
    let user = User::new("Алексей".to_string(), 30);
    println!("Создан пользователь: {:?}", user);
    
    // Генерация случайного имени файла
    let mut rng = rand::thread_rng();
    let random_number: u32 = rng.gen_range(1000..9999);
    let filename = format!("user_struct_{}.rs", random_number);
    
    // Код структуры для сохранения
    let struct_code = r#"#[derive(Debug)]
struct User {
    name: String,
    age: u32,
}

impl User {
    fn new(name: String, age: u32) -> User {
        User { name, age }
    }
}
"#;
    
    // Запись кода в файл
    let mut file = File::create(&filename).expect("Не удалось создать файл");
    file.write_all(struct_code.as_bytes()).expect("Не удалось записать в файл");
    
    println!("Структура пользователя сохранена в файл: {}", filename);
}