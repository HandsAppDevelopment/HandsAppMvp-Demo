import Foundation
import Moya

enum NewsApi {
    case everything(query: String)
}

// MARK: - Moya setup

extension NewsApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: AppDefaults.apiBaseUrl) else {
            fatalError("Failed to provide api base url")
        }
        return url
    }

    var path: String {
        switch self {
        case .everything:
            return "everything"
        }
    }

    var method: Moya.Method {
        switch self {
        case .everything:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .everything(query):
            let parameters: [String: Any] = [
                "apiKey": AppDefaults.apiKey,
                "q": query
            ]
            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.queryString
            )
        }
    }

    var sampleData: Data {
        switch self {
        case let .everything(query):
            let lowercasedQuery = query.lowercased()
            let zoo = ArticleResponse(
                title: "Zoo",
                author: "Author_1",
                description: "Description_1",
                publishedAt: "2020-03-12T12:34:45Z",
                urlToImage: nil
            )
            let cinema = ArticleResponse(
                title: "Cinema",
                author: "Author_2",
                description: "Description_2",
                publishedAt: "2020-03-12T12:35:45Z",
                urlToImage: nil
            )
            let cafe = ArticleResponse(
                title: "Cafe",
                author: "Author_3",
                description: "Description_3",
                publishedAt: "2020-03-12T12:36:45Z",
                urlToImage: nil
            )
            let articles: [ArticleResponse] = [zoo, cinema, cafe]
                .filter { $0.title.lowercased().contains(lowercasedQuery) }
            let search = SearchResponse(articles: articles)

            let jsonEncoder = JSONEncoder()
            let data = (try? jsonEncoder.encode(search)) ?? Data()
            return data
        }
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        return nil
    }
}
