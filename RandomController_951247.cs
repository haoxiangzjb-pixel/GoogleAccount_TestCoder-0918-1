using Microsoft.AspNetCore.Mvc;

namespace MyApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class RandomController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<RandomController> _logger;

        public RandomController(ILogger<RandomController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetRandom")]
        public IActionResult Get()
        {
            var randomValue = Summaries[Random.Shared.Next(Summaries.Length)];
            return Ok(new { Value = randomValue });
        }
    }
}