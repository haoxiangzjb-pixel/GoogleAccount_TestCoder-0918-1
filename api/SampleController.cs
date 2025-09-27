using Microsoft.AspNetCore.Mvc;

namespace Workspace.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SampleController : ControllerBase
    {
        // GET: api/Sample
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new { Message = "Hello from Sample API!" });
        }

        // GET: api/Sample/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok(new { Id = id, Name = "Sample Item" });
        }

        // POST: api/Sample
        [HttpPost]
        public IActionResult Post([FromBody] object value)
        {
            return CreatedAtAction(nameof(Get), new { id = 1 }, value);
        }
    }
}