@testable import HandsAppMvp_Demo

class SearchRouterMock: SearchRouterInput {
    enum Call: Equatable {
        case showArticleDetails(article: ArticleModel)

        static func == (lhs: Call, rhs: Call) -> Bool {
            return String(describing: lhs) == String(describing: rhs)
        }
    }

    private(set) var registeredCalls: [Call] = []

    func showArticleDetails(article: ArticleModel) {
        registeredCalls.append(.showArticleDetails(article: article))
    }
}
