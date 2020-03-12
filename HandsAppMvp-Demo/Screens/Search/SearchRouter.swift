import UIKit

protocol SearchRouterInput {
    func showArticleDetails(article: ArticleModel)
}

class SearchRouter: SearchRouterInput {

	// MARK: - Properties

    weak var view: ScreenTransitionable?

	// MARK: - SearchRouterInput

    func showArticleDetails(article: ArticleModel) {
        let viewController = ArticleDetailsScreenAssembly().assemble(article: article)
        view?.push(screen: viewController, animated: true)
    }
}
