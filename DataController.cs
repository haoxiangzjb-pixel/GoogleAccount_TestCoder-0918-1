using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DataController : ControllerBase
    {
        private readonly ILogger<DataController> _logger;

        public DataController(ILogger<DataController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var dataValues = new[]
            {
                new { Id = 1, Name = "Data 1", Value = 100 },
                new { Id = 2, Name = "Data 2", Value = 200 },
                new { Id = 3, Name = "Data 3", Value = 300 }
            };

            return Ok(dataValues);
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var item = new { Id = id, Name = $"Data {id}", Value = id * 100 };
            return Ok(item);
        }

        [HttpPost]
        public IActionResult Post([FromBody] dynamic data)
        {
            _logger.LogInformation("POST endpoint called with data: {Data}", data);
            
            // Simulate creating a new item
            var newItem = new 
            { 
                Id = new Random().Next(100, 1000), 
                Name = "New Data Item", 
                Value = new Random().Next(1, 100),
                CreatedAt = DateTime.UtcNow 
            };

            return CreatedAtAction(nameof(Get), new { id = newItem.Id }, newItem);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] dynamic data)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            _logger.LogInformation("PUT endpoint called for ID: {Id} with data: {Data}", id, data);
            
            var updatedItem = new 
            { 
                Id = id, 
                Name = "Updated Data Item", 
                Value = new Random().Next(1, 100),
                UpdatedAt = DateTime.UtcNow 
            };

            return Ok(updatedItem);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            _logger.LogInformation("DELETE endpoint called for ID: {Id}", id);
            
            return NoContent();
        }
    }
}