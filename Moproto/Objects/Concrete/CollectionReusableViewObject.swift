import UIKit

struct CollectionReusableViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UICollectionReusableView")
    var title: String = "collection_reusable_view_title".localize
    var description: String = "collection_reusable_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UICollectionReusableView.self))
}
