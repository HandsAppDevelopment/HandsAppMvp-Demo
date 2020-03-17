import XCTest
@testable import HandsAppMvp_Demo

class ArticleDetailsPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: ArticleDetailsPresenter!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        let router = ArticleDetailsRouterMock()
        let view = ArticleDetailsViewControllerMock()
        let output = ArticleDetailsScreenOutputMock()
        let articleModel = ArticleModel(
            title: "",
            author: "",
            description: "",
            publishedAt: "",
            urlToImage: nil
        )
        presenter = ArticleDetailsPresenter(router: router, article: articleModel)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}
