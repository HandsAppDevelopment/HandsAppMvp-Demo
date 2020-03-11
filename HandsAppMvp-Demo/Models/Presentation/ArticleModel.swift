import Foundation

struct ArticleModel: Equatable {
    let title: String
    let author: String
    let description: String
    let publishedAt: String
    let urlToImage: URL?

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title &&
            lhs.author == rhs.author &&
            lhs.description == rhs.description &&
            lhs.publishedAt == rhs.publishedAt &&
            lhs.urlToImage == rhs.urlToImage
    }
}
