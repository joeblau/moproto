import UIKit

struct TabBarItemObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UITabBarItem")
    var title: String = "tab_bar_item_title".localize
    var description: String = "tab_bar_item_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UITabBarItem.self))
}
