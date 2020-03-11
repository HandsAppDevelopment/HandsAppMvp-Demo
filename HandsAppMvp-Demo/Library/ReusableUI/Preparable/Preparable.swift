import UIKit

/**
 Protocol for cells and reusable views.
 `prepare` function is replacement for viewDidLoad of UIViewController.
 Call it after `dequeue with identifier` to prepare your cell or reusable view.
 */

protocol Preparable {
    func prepare(withViewModel viewModel: PreparableViewModel?)
}
