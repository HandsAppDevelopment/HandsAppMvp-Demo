import UIKit

class ArticleDetailsScreenAssembly {

    func assemble(
        article: ArticleModel,
        output: ArticleDetailsScreenOutput? = nil
    ) -> ArticleDetailsViewController {

        let router = ArticleDetailsRouter()
        let presenter = ArticleDetailsPresenter(router: router, article: article)
        let view = ArticleDetailsViewController(output: presenter)
        presenter.view = view
        presenter.output = output
        router.view = view

        return view
    }
}
