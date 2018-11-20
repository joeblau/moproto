import UIKit

struct SpritekitViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "SKView")
    var title: String = "spritekit_view_title".localize
    var description: String = "spritekit_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: "SKView")
}
