// Определение структуры User с полями name (String) и age (u32)
struct User {
    name: String,
    age: u32,
}

// Пример использования структуры
fn main() {
    let user1 = User {
        name: String::from("Alice"),
        age: 30,
    };

    println!("User: {}, Age: {}", user1.name, user1.age);
}