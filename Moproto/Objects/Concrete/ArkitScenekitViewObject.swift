import UIKit

struct ArkitScenekitViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "ARSCNView")
    var title: String = "arkit_scenekit_view_title".localize
    var description: String = "arkit_scenekit_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: "ARSCNView")
}
