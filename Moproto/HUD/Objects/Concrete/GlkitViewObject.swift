import UIKit

struct GlkitViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "GLKView")
    var title: String = "glkit_view_title".localize
    var description: String = "glkit_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: "GLKView")
}
