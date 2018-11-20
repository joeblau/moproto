import UIKit

struct ToolbarObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIToolbar")
    var title: String = "toolbar_title".localize
    var description: String = "toolbar_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIToolbar.self))
}
