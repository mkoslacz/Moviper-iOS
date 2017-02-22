import UIKit

protocol Module {
    func present(from fromVC: UIViewController?, style: UIModalTransitionStyle)
    func push(from navController: UINavigationController?)
}
