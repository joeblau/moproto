import UIKit

struct ObjectObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIObject")
    var title: String = "object_title".localize
    var description: String = "object_description".localize
    var category: ObjectCategory = .viewController
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: NSObject.self))
}
