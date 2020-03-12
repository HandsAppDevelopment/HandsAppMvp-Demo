import UIKit

protocol SearchTableAdapterOutput: AnyObject {
    func itemSelected(atIndex index: Int)
}

class SearchTableAdapter: NSObject {

    // MARK: - Properties

    var items: [PreparableViewModel] = []
    weak var output: SearchTableAdapterOutput?

}

// MARK: - UITableViewDataSource

extension SearchTableAdapter: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellId, for: indexPath)
        if let reusableCell = cell as? PreparableTableCell {
            reusableCell.prepare(withViewModel: viewModel)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SearchTableAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.itemSelected(atIndex: indexPath.row)
    }
}
