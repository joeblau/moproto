import UIKit

struct PageViewControllerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIPageViewController")
    var title: String = "page_view_controller_title".localize
    var description: String = "page_view_controller_description".localize
    var category: ObjectCategory = .viewController
    var type: NSItemProviderWriting = MoprotoViewControllerType(name: String(describing: UIPageViewController.self))
}
