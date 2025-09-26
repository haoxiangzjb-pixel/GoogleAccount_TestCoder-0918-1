// Определение типа Product на TypeScript
interface Product {
  id: number;
  название: string;
  цена: number;
}

// Пример использования
const товар: Product = {
  id: 1,
  название: "Смартфон",
  цена: 999.99
};

console.log(товар);