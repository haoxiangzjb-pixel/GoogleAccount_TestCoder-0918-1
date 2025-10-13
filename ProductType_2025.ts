// Определение интерфейса Product
interface Product {
  id: number;
  название: string;
  цена: number;
}

// Пример использования
const товар: Product = {
  id: 1,
  название: "Ноутбук",
  цена: 999.99
};

console.log(товар);