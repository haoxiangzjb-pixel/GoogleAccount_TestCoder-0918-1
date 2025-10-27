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
            _logger.LogInformation("POST endpoint called with value: {Value}", value);
            return Ok(new { message = "Value received successfully", receivedValue = value });
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object value)
        {
            _logger.LogInformation("PUT endpoint called for ID: {Id} with value: {Value}", id, value);
            return Ok(new { message = $"Value updated successfully for ID {id}", id = id, receivedValue = value });
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _logger.LogInformation("DELETE endpoint called for ID: {Id}", id);
            return Ok(new { message = $"Value with ID {id} deleted successfully" });
        }
    }
}