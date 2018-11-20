import UIKit

struct ScrollViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIScrollView")
    var title: String = "scroll_view_title".localize
    var description: String = "scroll_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIScrollView.self))
}
