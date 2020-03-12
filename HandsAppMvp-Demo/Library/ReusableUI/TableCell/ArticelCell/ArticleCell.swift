import UIKit
import SDWebImage

class ArticleCell: PreparableTableCell {
    // MARK: - Properties

    private let photoImageView = UIImageView()
    private let photoCoverView = UIView()
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
        prepareView()
        self.viewModel = viewModel as? ArticleCellViewModel
    }

    // MARK: - Prepare View

    private func prepareView() {
        contentView.clipsToBounds = true
        selectionStyle = .none
        setPhotoImageView()
        setPhotoCoverView()
        setTitleLabel()
        setAuthorLabel()
        setDateLabel()
        setDescriptionLabel()
    }

    private func setPhotoImageView() {
        photoImageView.contentMode = .scaleAspectFill
        contentView.addSubview(photoImageView)
        contentView.sendSubviewToBack(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setPhotoCoverView() {
        photoCoverView.backgroundColor = .black
        photoCoverView.alpha = 0.4
        contentView.addSubview(photoCoverView)
        photoCoverView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            photoCoverView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoCoverView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoCoverView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoCoverView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setTitleLabel() {
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: 17, weight: .medium)
        titleLabel.textColor = .white
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setAuthorLabel() {
        authorLabel.numberOfLines = 1
        authorLabel.font = .systemFont(ofSize: 15)
        authorLabel.textColor = .white
        contentView.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setDateLabel() {
        dateLabel.numberOfLines = 1
        dateLabel.font = .systemFont(ofSize: 15)
        dateLabel.textColor = .lightGray
        contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            dateLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func setDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textColor = .white
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                     constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 56)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
