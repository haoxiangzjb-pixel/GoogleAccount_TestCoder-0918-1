using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomController : ControllerBase
    {
        private readonly ILogger<RandomController> _logger;

        public RandomController(ILogger<RandomController> logger)
        {
            _logger = logger;
        }

        // GET: api/random
        [HttpGet]
        public IActionResult Get()
        {
            var randomValues = new[]
            {
                new { Id = 1, Name = "Item 1", Value = new Random().Next(1, 100) },
                new { Id = 2, Name = "Item 2", Value = new Random().Next(1, 100) },
                new { Id = 3, Name = "Item 3", Value = new Random().Next(1, 100) }
            };
            
            return Ok(randomValues);
        }

        // GET: api/random/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var randomValue = new { Id = id, Name = $"Item {id}", Value = new Random().Next(1, 100) };
            
            return Ok(randomValue);
        }

        // POST: api/random
        [HttpPost]
        public IActionResult Post([FromBody] object value)
        {
            _logger.LogInformation("Creating a new random item");
            
            // In a real application, you would implement the actual creation logic here
            var response = new { Success = true, Message = "Random item created successfully" };
            
            return Ok(response);
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object value)
        {
            _logger.LogInformation($"Updating random item with ID: {id}");
            
            // In a real application, you would implement the actual update logic here
            var response = new { Success = true, Message = $"Random item {id} updated successfully" };
            
            return Ok(response);
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _logger.LogInformation($"Deleting random item with ID: {id}");
            
            // In a real application, you would implement the actual deletion logic here
            var response = new { Success = true, Message = $"Random item {id} deleted successfully" };
            
            return Ok(response);
        }
    }
}