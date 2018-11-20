import UIKit

struct BarButtonItemObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIBarButtonItem")
    var title: String = "bar_button_item_title".localize
    var description: String = "bar_button_item_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIBarButtonItem.self))
}
