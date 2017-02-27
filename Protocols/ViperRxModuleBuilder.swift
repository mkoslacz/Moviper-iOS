import UIKit

protocol ViperRxModuleBuilder {
    func present(from fromVC: UIViewController?, style: UIModalTransitionStyle)
    func push(from navController: UINavigationController?)

    var viewController: UIViewController? { get }
}

extension ViperRxModuleBuilder {
    func present(from fromVC: UIViewController?, style: UIModalTransitionStyle) {
        if let viewController = fromVC {
            viewController.modalTransitionStyle = style
            fromVC?.present(viewController, animated: true, completion: nil)
        }
    }

    func push(from navController: UINavigationController?) {
        if let viewController = viewController {
            navController?.pushViewController(viewController, animated: true)
        }
    }
}
