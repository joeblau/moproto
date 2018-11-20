import UIKit

struct GlkitViewControllerObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "GLKViewController")
    var title: String = "glkit_view_controller_title".localize
    var description: String = "glkit_view_controller_description".localize
    var category: ObjectCategory = .viewController
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: "UIGlkitViewController"))
}
