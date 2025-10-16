using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
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
                Id = Guid.NewGuid(),
                Name = "Random Item",
                Value = new Random().Next(1, 100),
                Timestamp = DateTime.UtcNow
            };

            return Ok(randomValue);
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number.");
            }

            var randomValue = new
            {
                Id = id,
                Name = $"Random Item {id}",
                Value = new Random().Next(1, 100),
                Timestamp = DateTime.UtcNow
            };

            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            var result = new
            {
                Success = true,
                Message = "Data received successfully",
                ReceivedAt = DateTime.UtcNow,
                Data = data
            };

            return Ok(result);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            var result = new
            {
                Success = true,
                Message = $"Item {id} updated successfully",
                UpdatedAt = DateTime.UtcNow,
                Data = data
            };

            return Ok(result);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var result = new
            {
                Success = true,
                Message = $"Item {id} deleted successfully",
                DeletedAt = DateTime.UtcNow
            };

            return Ok(result);
        }
    }
}