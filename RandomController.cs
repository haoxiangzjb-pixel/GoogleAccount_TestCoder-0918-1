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
            {
                return BadRequest("ID must be a positive number");
            }

            var randomValue = new { 
                Id = id, 
                Name = $"Random Item {id}", 
                Value = new Random().NextDouble() 
            };
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] RandomInputModel model)
        {
            if (model == null)
            {
                return BadRequest("Model cannot be null");
            }

            var result = new { 
                Id = new Random().Next(1, 1000), 
                Name = model.Name ?? "Unnamed", 
                ProcessedAt = DateTime.UtcNow 
            };
            return CreatedAtAction(nameof(Get), new { id = result.Id }, result);
        }
    }

    public class RandomInputModel
    {
        public string? Name { get; set; }
        public int? Value { get; set; }
    }
}