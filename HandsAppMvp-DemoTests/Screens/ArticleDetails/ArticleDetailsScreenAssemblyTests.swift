import XCTest
@testable import HandsAppMvp_Demo

class ArticleDetailsScreenAssemblyTests: XCTestCase {

    // MARK: - Properties

    private var viewController: ArticleDetailsViewController!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        let articleModel = ArticleModel(
            title: "",
            author: "",
            description: "",
            publishedAt: "",
            urlToImage: nil
        )
        viewController = ArticleDetailsScreenAssembly().assemble(article: articleModel)
    }

	// MARK: - Tests

    func testViewOutput() {
        let isPresenter = viewController.output is ArticleDetailsPresenter
        XCTAssertTrue(isPresenter, "viewController.output is not ArticleDetailsPresenter")
    }

    func testViewInput() {
        guard let presenter = viewController.output as? ArticleDetailsPresenter else {
            XCTFail("Cannot assign viewController.output as ArticleDetailsPresenter")
            return
        }

        let isViewController = presenter.view is ArticleDetailsViewController
        XCTAssertTrue(isViewController, "presenter.view is not ArticleDetailsViewController")
    }

    func testRouterInput() {
        guard let presenter = viewController.output as? ArticleDetailsPresenter else {
            XCTFail("Cannot assign viewController.output as ArticleDetailsPresenter")
            return
        }

        let isRouter = presenter.router is ArticleDetailsRouter
        XCTAssertTrue(isRouter, "presenter.router is not ArticleDetailsRouter")
    }

    func testScreenTransitionable() {
        guard let presenter = viewController.output as? ArticleDetailsPresenter else {
            XCTFail("Cannot assign viewController.output as ArticleDetailsPresenter")
            return
        }
        guard let router = presenter.router as? ArticleDetailsRouter else {
            XCTFail("Cannot assign presenter.router as ArticleDetailsRouter")
            return
        }

        let isViewController = router.view is ArticleDetailsViewController
        XCTAssertTrue(isViewController, "router.view is not ArticleDetailsViewController")
    }
}
