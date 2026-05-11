using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private static readonly List<Product> _products = new()
    {
        new Product { Id = 1, Name = "Laptop", Price = 999.99m },
        new Product { Id = 2, Name = "Mouse", Price = 29.99m },
        new Product { Id = 3, Name = "Keyboard", Price = 79.99m }
    };

    /// <summary>
    /// Get all products
    /// </summary>
    [HttpGet]
    public ActionResult<IEnumerable<Product>> Get()
    {
        return Ok(_products);
    }

    /// <summary>
    /// Get a product by ID
    /// </summary>
    [HttpGet("{id}")]
    public ActionResult<Product> Get(int id)
    {
        var product = _products.FirstOrDefault(p => p.Id == id);
        if (product == null)
        {
            return NotFound();
        }
        return Ok(product);
    }

    /// <summary>
    /// Create a new product
    /// </summary>
    [HttpPost]
    public ActionResult<Product> Post([FromBody] Product product)
    {
        if (product == null || string.IsNullOrEmpty(product.Name))
        {
            return BadRequest("Invalid product data");
        }

        product.Id = _products.Max(p => p.Id) + 1;
        _products.Add(product);

        return CreatedAtAction(nameof(Get), new { id = product.Id }, product);
    }

    /// <summary>
    /// Update an existing product
    /// </summary>
    [HttpPut("{id}")]
    public IActionResult Put(int id, [FromBody] Product product)
    {
        var existingProduct = _products.FirstOrDefault(p => p.Id == id);
        if (existingProduct == null)
        {
            return NotFound();
        }

        existingProduct.Name = product.Name;
        existingProduct.Price = product.Price;

        return NoContent();
    }

    /// <summary>
    /// Delete a product
    /// </summary>
    [HttpDelete("{id}")]
    public IActionResult Delete(int id)
    {
        var product = _products.FirstOrDefault(p => p.Id == id);
        if (product == null)
        {
            return NotFound();
        }

        _products.Remove(product);
        return NoContent();
    }
}

public class Product
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public decimal Price { get; set; }
}
