import UIKit

struct NavigationItemObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UINavigationItem")
    var title: String = "navigation_item_title".localize
    var description: String = "navigation_item_description".localize
    var category: ObjectCategory = .control
    var type: NSItemProviderWriting = MoprotoControlType(name: String(describing: UINavigationItem.self))
}
