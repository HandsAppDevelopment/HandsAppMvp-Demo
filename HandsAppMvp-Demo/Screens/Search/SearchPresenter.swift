import Moya

protocol SearchScreenOutput: AnyObject {}

protocol SearchScreenInput: AnyObject {}

class SearchPresenter {

    // MARK: - Properties

    weak var view: SearchViewInput?
	let router: SearchRouterInput
    weak var output: SearchScreenOutput?

    private let newsApiProvider: MoyaProvider<NewsApi>
    private var articlesItems: [PreparableViewModel] = []
    private let articlesMapper = ArticleMapper()

    // MARK: - Lifecycle

    init(router: SearchRouterInput, newsApiProvider: MoyaProvider<NewsApi>) {
    	self.router = router
        self.newsApiProvider = newsApiProvider
    }
}

// MARK: - SearchViewOutput

extension SearchPresenter: SearchViewOutput {
    func searchTextChanged(text: String?) {
        let requestTarget = NewsApi.everything(query: text ?? "")
        newsApiProvider.request(requestTarget) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .failure(error):
                self.view?.showErrorAlert(withMessage: error.localizedDescription)
            case let .success(response):
                let searchResponse: SearchResponse
                do {
                    searchResponse = try response.map(SearchResponse.self)
                } catch {
                    self.view?.showErrorAlert(withMessage: error.localizedDescription)
                    return
                }
                self.articlesItems = searchResponse.articles?.map {
                    let article = self.articlesMapper.mapResponseToModel(response: $0)
                    return ArticleCellViewModel(article: article)
                } ?? []
                self.view?.reloadTable(withItems: self.articlesItems)
            }
        }
    }
}

// MARK: - SearchTableAdapterOutput

extension SearchPresenter: SearchTableAdapterOutput {
    func itemSelected(atIndex: Int) {

    }
}

// MARK: - SearchScreenInput

extension SearchPresenter: SearchScreenInput {}
