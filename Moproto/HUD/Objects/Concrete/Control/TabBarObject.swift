import UIKit

struct TabBarObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UITabBar")
    var title: String = "tab_bar_title".localize
    var description: String = "tab_bar_description".localize
    var category: ObjectCategory = .control
    var type: NSItemProviderWriting = MoprotoControlType(name: String(describing: UITabBar.self))
}
