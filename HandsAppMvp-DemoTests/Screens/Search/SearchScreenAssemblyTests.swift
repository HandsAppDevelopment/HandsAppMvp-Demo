import XCTest
@testable import HandsAppMvp_Demo

class SearchScreenAssemblyTests: XCTestCase {

    // MARK: - Properties

    private var viewController: SearchViewController!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        viewController = SearchScreenAssembly().assemble()
    }

	// MARK: - Tests

    func testViewOutput() {
        let isPresenter = viewController.output is SearchPresenter
        XCTAssertTrue(isPresenter, "viewController.output is not SearchPresenter")
    }

    func testViewInput() {
        guard let presenter = viewController.output as? SearchPresenter else {
            XCTFail("Cannot assign viewController.output as SearchPresenter")
            return
        }

        let isViewController = presenter.view is SearchViewController
        XCTAssertTrue(isViewController, "presenter.view is not SearchViewController")
    }

    func testTableAdapterOutput() {
        let isPresenter = viewController.tableAdapter.output is SearchPresenter
        XCTAssertTrue(isPresenter, "viewController.tableAdapter.output is not SearchPresenter")
    }

    func testRouterInput() {
        guard let presenter = viewController.output as? SearchPresenter else {
            XCTFail("Cannot assign viewController.output as SearchPresenter")
            return
        }

        let isRouter = presenter.router is SearchRouter
        XCTAssertTrue(isRouter, "presenter.router is not SearchRouter")
    }

    func testScreenTransitionable() {
        guard let presenter = viewController.output as? SearchPresenter else {
            XCTFail("Cannot assign viewController.output as SearchPresenter")
            return
        }
        guard let router = presenter.router as? SearchRouter else {
            XCTFail("Cannot assign presenter.router as SearchRouter")
            return
        }

        let isViewController = router.view is SearchViewController
        XCTAssertTrue(isViewController, "router.view is not SearchViewController")
    }
}
