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

        [HttpGet]
        public IActionResult Get()
        {
            var randomValue = new
            {
                Id = new Random().Next(1, 100),
                Name = "Random Item",
                Timestamp = DateTime.UtcNow
            };
            return Ok(randomValue);
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }

            var randomValue = new
            {
                Id = id,
                Name = $"Random Item {id}",
                Value = new Random().NextDouble()
            };
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            _logger.LogInformation("POST endpoint called with data: {@Data}", data);
            
            return Ok(new
            {
                Message = "Data received successfully",
                ReceivedAt = DateTime.UtcNow
            });
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            _logger.LogInformation("PUT endpoint called for ID {Id} with data: {@Data}", id, data);
            
            return Ok(new
            {
                Message = $"Item {id} updated successfully",
                UpdatedAt = DateTime.UtcNow
            });
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _logger.LogInformation("DELETE endpoint called for ID {Id}", id);
            
            return Ok(new
            {
                Message = $"Item {id} deleted successfully",
                DeletedAt = DateTime.UtcNow
            });
        }
    }
}