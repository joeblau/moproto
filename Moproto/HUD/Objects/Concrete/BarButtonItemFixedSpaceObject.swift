import UIKit

struct BarButtonItemFixedSpaceObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIBarButtonItemFixedSpace")
    var title: String = "fixed_space_bar_button_item_title".localize
    var description: String = "fixed_space_bar_button_item_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: "UIBarButtonItemFixedSpace")
}
