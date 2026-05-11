using Microsoft.AspNetCore.Mvc;

namespace MyApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private static readonly List<Product> Products = new()
    {
        new Product { Id = 1, Name = "Laptop", Price = 999.99m },
        new Product { Id = 2, Name = "Mouse", Price = 29.99m }
    };

    [HttpGet]
    public ActionResult<IEnumerable<Product>> Get()
    {
        return Ok(Products);
    }

    [HttpGet("{id}")]
    public ActionResult<Product> GetById(int id)
    {
        var product = Products.FirstOrDefault(p => p.Id == id);
        if (product == null)
            return NotFound();
        
        return Ok(product);
    }

    [HttpPost]
    public ActionResult<Product> Create([FromBody] Product product)
    {
        product.Id = Products.Max(p => p.Id) + 1;
        Products.Add(product);
        return CreatedAtAction(nameof(GetById), new { id = product.Id }, product);
    }

    [HttpPut("{id}")]
    public IActionResult Update(int id, [FromBody] Product updatedProduct)
    {
        var product = Products.FirstOrDefault(p => p.Id == id);
        if (product == null)
            return NotFound();

        product.Name = updatedProduct.Name;
        product.Price = updatedProduct.Price;
        return NoContent();
    }

    [HttpDelete("{id}")]
    public IActionResult Delete(int id)
    {
        var product = Products.FirstOrDefault(p => p.Id == id);
        if (product == null)
            return NotFound();

        Products.Remove(product);
        return NoContent();
    }
}

public class Product
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public decimal Price { get; set; }
}
