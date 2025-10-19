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
            var randomValue = new { 
                Id = new Random().Next(1, 100), 
                Message = "This is a random value", 
                Timestamp = DateTime.UtcNow 
            };
            return Ok(randomValue);
        }

        // GET: api/random/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var randomValue = new { 
                Id = id, 
                Value = new Random().NextDouble(), 
                Description = $"Random value for ID {id}" 
            };
            return Ok(randomValue);
        }

        // POST: api/random
        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            var result = new { 
                Success = true, 
                ReceivedAt = DateTime.UtcNow, 
                Processed = true 
            };
            return Ok(result);
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            var result = new { 
                Id = id, 
                Updated = true, 
                UpdatedAt = DateTime.UtcNow 
            };
            return Ok(result);
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var result = new { 
                Id = id, 
                Deleted = true, 
                DeletedAt = DateTime.UtcNow 
            };
            return Ok(result);
        }
    }
}