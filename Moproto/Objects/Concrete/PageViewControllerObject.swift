import UIKit

struct PageViewControllerObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIPageViewController")
    var title: String = "page_view_controller_title".localize
    var description: String = "page_view_controller_description".localize
    var category: ObjectCategory = .viewController
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIPageViewController.self))
}
