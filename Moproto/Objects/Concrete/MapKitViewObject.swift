import UIKit

struct MapKitViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "MKMapView")
    var title: String = "map_kit_view_title".localize
    var description: String = "map_kit_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: "MKMapKitView")
}
