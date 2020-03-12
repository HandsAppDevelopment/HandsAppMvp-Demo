import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        setupStartViewController()
        return true
    }

    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .systemBlue
        window?.makeKeyAndVisible()
    }

    private func setupStartViewController() {
        let searchViewController = SearchScreenAssembly().assemble()
        let navigationController = UINavigationController(rootViewController: searchViewController)
        window?.rootViewController = navigationController
    }
}

