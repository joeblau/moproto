import UIKit

struct MetalkitViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "MTKView")
    var title: String = "metalkit_view_title".localize
    var description: String = "metalkit_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: "MTKView")
}
