protocol SearchScreenOutput: AnyObject {}

protocol SearchScreenInput: AnyObject {}

class SearchPresenter {

    // MARK: - Properties

    weak var view: SearchViewInput?
	let router: SearchRouterInput
    weak var output: SearchScreenOutput?

    // MARK: - Lifecycle

    init(router: SearchRouterInput) {
    	self.router = router
    }
}

// MARK: - SearchViewOutput

extension SearchPresenter: SearchViewOutput {}

// MARK: - SearchTableAdapterOutput

extension SearchPresenter: SearchTableAdapterOutput {}

// MARK: - SearchScreenInput

extension SearchPresenter: SearchScreenInput {}
