import UIKit

struct ArkitSpritekitViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "ARSKView")
    var title: String = "arkit_spritekit_view_title".localize
    var description: String = "arkit_spritekit_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: "ARSKView")
}
