import UIKit
import Moya

class SearchScreenAssembly {
    func assemble(output: SearchScreenOutput? = nil) -> SearchViewController {
        let router = SearchRouter()
        let newsApiProvider = MoyaProvider<NewsApi>(plugins: [NetworkLoggerPlugin()])
        let presenter = SearchPresenter(router: router, newsApiProvider: newsApiProvider)
        let tableAdapter = SearchTableAdapter()
        let view = SearchViewController(output: presenter,
                                        tableAdapter: tableAdapter)
        presenter.view = view
        presenter.output = output
        router.view = view
        tableAdapter.output = presenter

        return view
    }
}
