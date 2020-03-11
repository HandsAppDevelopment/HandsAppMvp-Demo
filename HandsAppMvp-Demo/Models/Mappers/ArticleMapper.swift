import Foundation

class ArticleMapper {

    private let dateUtils = DateUtils()
    private let dateFormat = "HH:mm dd.MM.YYYY"

    func mapResponseToModel(response: ArticleResponse) -> ArticleModel {
        let dateString = dateUtils.dateString(
            fromIso8601String: response.publishedAt,
            format: dateFormat
        )

        let imageUrl: URL?
        if let urlString = response.urlToImage,
            let url = URL(string: urlString) {
            imageUrl = url
        } else {
            imageUrl = nil
        }

        let model = ArticleModel(
            title: response.title,
            author: response.author ?? String(),
            description: response.description ?? String(),
            publishedAt: dateString,
            urlToImage: imageUrl
        )
        return model
    }
}
