import UIKit

extension Module {
    func present(from fromVC: UIViewController?, style: UIModalTransitionStyle) {
        if let viewController = viewController {
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
