using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace DockerAPI.Controllers;

[ApiController]
[Route("api/[controller]")]
public class PodcastController : ControllerBase
{

    [HttpGet]
    [Produces<List<string>>]
    public async Task<List<string>> Get()
    {
        await using var db = new SqlConnection("Server=tcp:database;Database=SimpleList;User=sa;Password=Test@123;TrustServerCertificate=True;");
        var po = await db.QueryAsync<Podcast>("SELECT * FROM Podcast");
        return po.Select(p => p.Title).OrderBy(a => a).ToList();
    }
    
    [HttpGet("{id}")]
    public string Get(int id)
    {
        return $"value {id}";
    }

    public record Podcast (Guid Id, string Title);
}