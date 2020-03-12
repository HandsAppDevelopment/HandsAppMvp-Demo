import UIKit

protocol ArticleDetailsViewInput: AnyObject {
    func setArticle(_ article: ArticleModel)
}

protocol ArticleDetailsViewOutput {
    func viewDidLoad()
}

class ArticleDetailsViewController: UIViewController, ScreenTransitionable {

    // MARK: - Properties

    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let dateLabel = UILabel()
    private let descriptionLabel = UILabel()

    let output: ArticleDetailsViewOutput

    // MARK: - Lifecycle

    init(output: ArticleDetailsViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        output.viewDidLoad()
    }

    // MARK: - Prepare View

    private func prepareView() {
        view.backgroundColor = .systemBackground
        setScrollView()
        setImageView()
        setTitleLabel()
        setAuthorLabel()
        setDateLabel()
        setDescriptionLabel()
    }

    private func setScrollView() {
        scrollView.showsVerticalScrollIndicator = true
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        scrollView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 240)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 19, weight: .medium)
        scrollView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setAuthorLabel() {
        authorLabel.numberOfLines = 0
        authorLabel.font = .systemFont(ofSize: 17)
        scrollView.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setDateLabel() {
        dateLabel.numberOfLines = 1
        dateLabel.font = .systemFont(ofSize: 17)
        dateLabel.textColor = .systemGray
        scrollView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            dateLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 17)
        scrollView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,
                                                  constant: 24),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,
                                                     constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    // MARK: - Actions
}

// MARK: - ArticleDetailsViewInput

extension ArticleDetailsViewController: ArticleDetailsViewInput {
    func setArticle(_ article: ArticleModel) {
        title = article.title
        titleLabel.text = article.title
        authorLabel.text = article.author
        dateLabel.text = article.publishedAt
        descriptionLabel.text = article.description
        imageView.sd_setImage(with: article.urlToImage)
    }
}
