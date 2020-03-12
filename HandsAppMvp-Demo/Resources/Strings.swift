import Foundation

enum Strings {
    private static let hostingBundle = Bundle.main

    static let error = NSLocalizedString("error", bundle: hostingBundle, comment: "")
    static let ok = NSLocalizedString("ok", bundle: hostingBundle, comment: "")

    static let newsSearch = NSLocalizedString("news_search", bundle: hostingBundle, comment: "")
    static let articlesSearchPlaceholder = NSLocalizedString(
        "articlesSearchPlaceholder",
        bundle: hostingBundle,
        comment: ""
    )
}
