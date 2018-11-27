import UIKit

struct ScenekitViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "SCNView")
    var title: String = "scenekit_view_title".localize
    var description: String = "scenekit_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: "SCNView")
}
