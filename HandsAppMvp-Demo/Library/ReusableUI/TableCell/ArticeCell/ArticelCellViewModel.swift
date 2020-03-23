class ArticleCellViewModel: PreparableViewModel {
    let cellId: String = ArticleCell.className
    let article: ArticleModel

    init(article: ArticleModel) {
        self.article = article
    }
}
