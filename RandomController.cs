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

        // GET: api/random
        [HttpGet]
        public IActionResult Get()
        {
            var randomValue = new
            {
                Id = Guid.NewGuid(),
                Value = new Random().Next(1, 100),
                Timestamp = DateTime.UtcNow
            };
            
            return Ok(randomValue);
        }

        // GET: api/random/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var randomValue = new
            {
                Id = id,
                Value = new Random().Next(1, 100),
                Description = $"Random value for ID {id}",
                Timestamp = DateTime.UtcNow
            };
            
            return Ok(randomValue);
        }

        // POST: api/random
        [HttpPost]
        public IActionResult Post([FromBody] RandomInputModel input)
        {
            if (input == null)
            {
                return BadRequest("Input cannot be null");
            }

            var result = new
            {
                InputValue = input.Value,
                GeneratedValue = new Random().Next(input.MinValue, input.MaxValue),
                Timestamp = DateTime.UtcNow
            };

            return Ok(result);
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] RandomInputModel input)
        {
            if (input == null)
            {
                return BadRequest("Input cannot be null");
            }

            var result = new
            {
                Id = id,
                InputValue = input.Value,
                UpdatedValue = new Random().Next(input.MinValue, input.MaxValue),
                Timestamp = DateTime.UtcNow
            };

            return Ok(result);
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var result = new
            {
                Id = id,
                Deleted = true,
                Timestamp = DateTime.UtcNow
            };

            _logger.LogInformation($"Random item with ID {id} was deleted");
            
            return Ok(result);
        }
    }

    public class RandomInputModel
    {
        public string Value { get; set; } = string.Empty;
        public int MinValue { get; set; } = 1;
        public int MaxValue { get; set; } = 100;
    }
}