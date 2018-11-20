import UIKit

struct PageControlObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIPageControl")
    var title: String = "page_control_title".localize
    var description: String = "page_control_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIPageControl.self))
}
