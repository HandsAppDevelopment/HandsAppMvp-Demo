import UIKit
import SDWebImage

class ArticleCell: PreparableTableCell {
    // MARK: - Properties

    private let photoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let dateLabel = UILabel()
    private let descriptionLabel = UILabel()

    var viewModel: ArticleCellViewModel? {
        didSet {
            guard let article = viewModel?.article else { return }
            titleLabel.text = article.title
            authorLabel.text = article.author
            dateLabel.text = article.publishedAt
            descriptionLabel.text = article.description
            photoImageView.sd_setImage(with: article.urlToImage)
        }
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }

    override func prepare(withViewModel viewModel: PreparableViewModel?) {
        self.viewModel = viewModel as? ArticleCellViewModel
        prepareView()
    }

    // MARK: - Prepare View

    private func prepareView() {

    }
}
