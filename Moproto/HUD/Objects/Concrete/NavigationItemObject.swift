import UIKit

struct NavigationItemObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UINavigationItem")
    var title: String = "navigation_item_title".localize
    var description: String = "navigation_item_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UINavigationItem.self))
}
