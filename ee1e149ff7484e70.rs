// Определение структуры User
struct User {
    name: String,
    age: u32,
}

fn main() {
    // Создание экземпляра структуры User
    let user1 = User {
        name: String::from("Alice"),
        age: 30,
    };

    // Вывод полей структуры
    println!("User name: {}", user1.name);
    println!("User age: {}", user1.age);
}