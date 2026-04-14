data class Book(
    val title: String,
    val author: String,
    val isbn: String,
    val publicationYear: Int,
    val genre: String? = null,
    val pageCount: Int? = null
)
