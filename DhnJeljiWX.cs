using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SampleDataController : ControllerBase
    {
        private readonly ILogger<SampleDataController> _logger;

        public SampleDataController(ILogger<SampleDataController> logger)
        {
            _logger = logger;
        }

        // GET: api/sampledata
        [HttpGet]
        public IActionResult Get()
        {
            var sampleData = new[]
            {
                new { Id = 1, Name = "Sample 1", Description = "This is sample data 1" },
                new { Id = 2, Name = "Sample 2", Description = "This is sample data 2" },
                new { Id = 3, Name = "Sample 3", Description = "This is sample data 3" }
            };
            
            return Ok(sampleData);
        }

        // GET: api/sampledata/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var sampleItem = new { Id = id, Name = $"Sample {id}", Description = $"This is sample data {id}" };
            
            return Ok(sampleItem);
        }

        // POST: api/sampledata
        [HttpPost]
        public IActionResult Post([FromBody] dynamic value)
        {
            _logger.LogInformation("Creating a new sample data item");
            
            var response = new { Success = true, Message = "Sample data item created successfully", Id = new Random().Next(1, 1000) };
            
            return Ok(response);
        }

        // PUT: api/sampledata/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] dynamic value)
        {
            _logger.LogInformation($"Updating sample data item with ID: {id}");
            
            var response = new { Success = true, Message = $"Sample data item {id} updated successfully" };
            
            return Ok(response);
        }

        // DELETE: api/sampledata/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _logger.LogInformation($"Deleting sample data item with ID: {id}");
            
            var response = new { Success = true, Message = $"Sample data item {id} deleted successfully" };
            
            return Ok(response);
        }
    }
}