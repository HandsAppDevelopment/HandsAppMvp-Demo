protocol ArticleDetailsScreenOutput: AnyObject {}

protocol ArticleDetailsScreenInput: AnyObject {}

class ArticleDetailsPresenter {

    // MARK: - Properties

    weak var view: ArticleDetailsViewInput?
	let router: ArticleDetailsRouterInput
    weak var output: ArticleDetailsScreenOutput?

    private let article: ArticleModel

    // MARK: - Lifecycle

    init(router: ArticleDetailsRouterInput, article: ArticleModel) {
        self.router = router
        self.article = article
    }
}

// MARK: - ArticleDetailsViewOutput

extension ArticleDetailsPresenter: ArticleDetailsViewOutput {
    func viewDidLoad() {
        view?.setArticle(article)
    }
}

// MARK: - ArticleDetailsScreenInput

extension ArticleDetailsPresenter: ArticleDetailsScreenInput {}
