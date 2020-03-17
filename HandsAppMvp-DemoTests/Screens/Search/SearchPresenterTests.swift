import XCTest
import Moya
@testable import HandsAppMvp_Demo

class SearchPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: SearchPresenter!

    private let router = SearchRouterMock()
    private let view = SearchViewControllerMock()
    private let output = SearchScreenOutputMock()
    private let zoo = ArticleModel(
        title: "Zoo",
        author: "Author_1",
        description: "Description_1",
        publishedAt: "15:34 12.03.2020",
        urlToImage: nil
    )

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        let newsApiProvider = MoyaProvider<NewsApi> (
            stubClosure: { _ in .delayed(seconds: 1) }
        )
        presenter = SearchPresenter(router: router, newsApiProvider: newsApiProvider)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

    func testSearchTextChanged() {
        let expectation = XCTestExpectation(description: "Get right search results")
        presenter.searchTextChanged(text: "zo")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
            guard let self = self else { return }
            let expectedCalls: [SearchViewControllerMock.Call] = [
                .reloadTable(items: [ArticleCellViewModel(article: self.zoo)])
            ]
            if self.view.registeredCalls == expectedCalls { expectation.fulfill() }
        }
        wait(for: [expectation], timeout: 3)
    }

    func testItemSelected() {
        let expectation = XCTestExpectation(description: "Get right search results")
        presenter.searchTextChanged(text: "zo")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
            guard let self = self else { return }
            self.presenter.itemSelected(atIndex: 0)
            let expectedCalls: [SearchRouterMock.Call] = [
                .showArticleDetails(article: self.zoo)
            ]
            if self.router.registeredCalls == expectedCalls { expectation.fulfill() }
        }
        wait(for: [expectation], timeout: 3)
    }
}
