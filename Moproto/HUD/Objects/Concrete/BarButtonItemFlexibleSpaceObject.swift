import UIKit

struct BarButtonItemFlexibleSpaceObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIBarButtonItemFlexibleSpace")
    var title: String = "flexible_space_bar_button_item_title".localize
    var description: String = "flexible_space_bar_button_item_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: "UIBarButtonItemFlexibleSpace")
}
