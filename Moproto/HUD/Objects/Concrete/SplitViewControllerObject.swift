import UIKit

struct SplitViewControllerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UISplitViewController")
    var title: String = "split_view_controller_title".localize
    var description: String = "split_view_controller_description".localize
    var category: ObjectCategory = .viewController
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UISplitViewController.self))
}
