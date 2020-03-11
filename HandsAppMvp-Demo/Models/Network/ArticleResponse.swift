struct ArticleResponse: Decodable {
    let title: String
    let author: String?
    let description: String?
    let publishedAt: String
    let urlToImage: String?
}
