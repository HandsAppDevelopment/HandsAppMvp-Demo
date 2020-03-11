import UIKit

protocol SearchViewInput: AnyObject {}

protocol SearchViewOutput {}

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
        title = Strings.feed
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        prepareSearchController()
        prepareTableView()
    }

    private func prepareSearchController() {
        searchController.searchBar.placeholder = Strings.articlesSearchPlaceholder
        searchController.searchBar.sizeToFit()
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

    private func prepareTableView() {
        let cellNib = UINib(nibName: ArticleCell.className, bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: ArticleCell.className)
        tableView.rowHeight = 200
        tableView.dataSource = nil
        tableView.delegate = nil

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
}

// MARK: - SearchViewInput

extension SearchViewController: SearchViewInput {}
