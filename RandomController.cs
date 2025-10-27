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
            var randomValue = new
            {
                Id = new Random().Next(1, 100),
                Value = Guid.NewGuid().ToString(),
                Timestamp = DateTime.UtcNow
            };
            
            return Ok(randomValue);
        }

        // GET: api/random/5
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
                Value = $"Random value for ID {id}",
                Timestamp = DateTime.UtcNow
            };

            return Ok(randomValue);
        }

        // POST: api/random
        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            var result = new
            {
                Message = "Data received successfully",
                ReceivedAt = DateTime.UtcNow,
                Data = data
            };

            return Ok(result);
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            var result = new
            {
                Message = $"Data updated for ID {id}",
                UpdatedAt = DateTime.UtcNow,
                Id = id,
                Data = data
            };

            return Ok(result);
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var result = new
            {
                Message = $"Resource with ID {id} has been deleted",
                DeletedAt = DateTime.UtcNow,
                Id = id
            };

            return Ok(result);
        }
    }
}