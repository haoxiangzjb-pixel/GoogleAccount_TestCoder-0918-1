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
            var random = new
            {
                Id = new Random().Next(1, 100),
                Name = "Random Item",
                Timestamp = DateTime.UtcNow
            };
            return Ok(random);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }

            var random = new
            {
                Id = id,
                Name = $"Random Item {id}",
                Value = new Random().NextDouble() * 100
            };

            return Ok(random);
        }

        [HttpPost]
        public IActionResult Post([FromBody] RandomItemModel model)
        {
            if (model == null)
            {
                return BadRequest("Model cannot be null");
            }

            var response = new
            {
                Id = new Random().Next(1, 1000),
                Name = model.Name,
                CreatedAt = DateTime.UtcNow
            };

            return CreatedAtAction(nameof(GetById), new { id = response.Id }, response);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] RandomItemModel model)
        {
            if (model == null || id <= 0)
            {
                return BadRequest("Invalid input");
            }

            var updated = new
            {
                Id = id,
                Name = model.Name,
                UpdatedAt = DateTime.UtcNow
            };

            return Ok(updated);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }

            return Ok(new { message = $"Item with ID {id} has been deleted" });
        }
    }

    public class RandomItemModel
    {
        public string? Name { get; set; }
        public string? Description { get; set; }
    }
}