import UIKit

class SearchScreenAssembly {

    func assemble(output: SearchScreenOutput? = nil) -> SearchViewController {

        let router = SearchRouter()
        let presenter = SearchPresenter(router: router)
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
