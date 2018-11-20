import UIKit

struct TabBarObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UITabBar")
    var title: String = "tab_bar_title".localize
    var description: String = "tab_bar_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UITabBar.self))
}
