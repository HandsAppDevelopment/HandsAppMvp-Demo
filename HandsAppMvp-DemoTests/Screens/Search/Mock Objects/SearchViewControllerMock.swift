@testable import HandsAppMvp_Demo

class SearchViewControllerMock: SearchViewInput {
    enum Call: Equatable {
        case reloadTable(items: [PreparableViewModel])
        case showAlert(title: String?, message: String?)
        case showErrorAlert(message: String?)

        static func == (lhs: Call, rhs: Call) -> Bool {
            return String(describing: lhs) == String(describing: rhs)
        }
    }

    private(set) var registeredCalls: [Call] = []

    func reloadTable(withItems items: [PreparableViewModel]) {
        registeredCalls.append(.reloadTable(items: items))
    }
    func showAlert(withTitle title: String?, message: String?) {
        registeredCalls.append(.showAlert(title: title, message: message))
    }
    func showErrorAlert(withMessage message: String?) {
        registeredCalls.append(.showErrorAlert(message: message))
    }
}
