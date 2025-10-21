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
            var randomValues = new
            {
                id = new Random().Next(1, 100),
                name = "Random Item",
                timestamp = DateTime.UtcNow
            };
            return Ok(randomValues);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }

            var randomItem = new
            {
                id = id,
                name = $"Random Item {id}",
                description = $"This is a randomly generated item with ID {id}",
                timestamp = DateTime.UtcNow
            };

            return Ok(randomItem);
        }

        [HttpPost]
        public IActionResult Create([FromBody] CreateRandomItemRequest request)
        {
            if (request == null)
            {
                return BadRequest("Request body cannot be null");
            }

            var newItem = new
            {
                id = new Random().Next(100, 1000),
                name = request.Name ?? "Unnamed Item",
                description = request.Description ?? "No description provided",
                timestamp = DateTime.UtcNow
            };

            return CreatedAtAction(nameof(GetById), new { id = newItem.id }, newItem);
        }

        public class CreateRandomItemRequest
        {
            public string? Name { get; set; }
            public string? Description { get; set; }
        }
    }
}