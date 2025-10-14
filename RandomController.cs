using Microsoft.AspNetCore.Mvc;

namespace MyApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            var random = new { value = new Random().Next() };
            return Ok(random);
        }
    }
}