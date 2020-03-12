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
        presenter = ArticleDetailsPresenter(router: router)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}
