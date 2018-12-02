import UIKit

struct TabBarControllerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UITabBarController")
    var title: String = "tab_bar_controller_title".localize
    var description: String = "tab_bar_controller_description".localize
    var category: ObjectCategory = .controller
    var type: NSItemProviderWriting = MoprotoViewControllerType(name: String(describing: UITabBarController.self))
}
