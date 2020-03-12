import UIKit

protocol SearchViewInput: UserMessagesView {
    func reloadTable(withItems items: [PreparableViewModel])
}

protocol SearchViewOutput {
    func searchTextChanged(text: String?)
}

class SearchViewController: UIViewController, ScreenTransitionable {

    // MARK: - Properties

    let output: SearchViewOutput

    let tableView = UITableView()
    let tableAdapter: SearchTableAdapter
    private let searchController = UISearchController()

    // MARK: - Lifecycle

    init(output: SearchViewOutput, tableAdapter: SearchTableAdapter) {
        self.output = output
        self.tableAdapter = tableAdapter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }

    // MARK: - Prepare View

    private func prepareView() {
        title = Strings.newsSearch
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        prepareSearchController()
        prepareTableView()
    }

    private func prepareSearchController() {
        searchController.searchBar.placeholder = Strings.articlesSearchPlaceholder
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchTextField.addTarget(
            self,
            action: #selector(searchTextChanged(_:)),
            for: .editingChanged
        )
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

    private func prepareTableView() {
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.className)
        tableView.rowHeight = 200
        tableView.dataSource = tableAdapter
        tableView.delegate = tableAdapter

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableContraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(tableContraints)
    }


    // MARK: - Actions

    @objc
    private func searchTextChanged(_ textField: UITextField) {
        output.searchTextChanged(text: textField.text)
    }
}

// MARK: - SearchViewInput

extension SearchViewController: SearchViewInput {
    func reloadTable(withItems items: [PreparableViewModel]) {
        tableAdapter.items = items
        tableView.reloadData()
    }
}
