import UIKit

struct GlkitViewControllerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "GLKViewController")
    var title: String = "glkit_view_controller_title".localize
    var description: String = "glkit_view_controller_description".localize
    var category: ObjectCategory = .viewController
    var type: NSItemProviderWriting = MoprotoViewControllerType(name: String(describing: "UIGlkitViewController"))
}
