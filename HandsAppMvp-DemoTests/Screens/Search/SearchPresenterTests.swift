import XCTest
@testable import HandsAppMvp_Demo

class SearchPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: SearchPresenter!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        let router = SearchRouterMock()
        let view = SearchViewControllerMock()
        let output = SearchScreenOutputMock()
        presenter = SearchPresenter(router: router)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}
