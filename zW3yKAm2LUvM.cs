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
            var randomValue = new { 
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
                return BadRequest("ID must be a positive integer");

            var randomValue = new { 
                Id = id, 
                Name = $"Random Item {id}",
                Value = new Random().NextDouble(),
                Timestamp = DateTime.UtcNow 
            };
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] RandomInputModel model)
        {
            if (model == null)
                return BadRequest("Model cannot be null");

            var result = new { 
                Id = new Random().Next(1, 1000),
                Name = model.Name,
                ProcessedValue = model.Value * new Random().Next(1, 10),
                CreatedAt = DateTime.UtcNow
            };
            
            return CreatedAtAction(nameof(Get), new { id = result.Id }, result);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] RandomInputModel model)
        {
            if (id <= 0)
                return BadRequest("ID must be a positive integer");
            
            if (model == null)
                return BadRequest("Model cannot be null");

            var result = new { 
                Id = id,
                Name = model.Name,
                UpdatedValue = model.Value * new Random().Next(1, 10),
                UpdatedAt = DateTime.UtcNow
            };
            
            return Ok(result);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
                return BadRequest("ID must be a positive integer");

            // In a real application, you would delete the actual resource
            var result = new { 
                Id = id,
                Deleted = true,
                DeletedAt = DateTime.UtcNow
            };
            
            return Ok(result);
        }
    }

    public class RandomInputModel
    {
        public string Name { get; set; } = string.Empty;
        public int Value { get; set; }
    }
}