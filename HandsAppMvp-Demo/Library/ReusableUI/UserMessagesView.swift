import UIKit

protocol UserMessagesView: AnyObject {
    func showAlert(withTitle title: String?, message: String?)
    func showErrorAlert(withMessage message: String?)
}

extension UserMessagesView where Self: UIViewController {
    func showAlert(withTitle title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Strings.ok, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }

    func showErrorAlert(withMessage message: String?) {
        showAlert(withTitle: Strings.error, message: message)
    }
}
