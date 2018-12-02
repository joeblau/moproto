import UIKit

struct CollectionReusableViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UICollectionReusableView")
    var title: String = "collection_reusable_view_title".localize
    var description: String = "collection_reusable_view_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoViewType(name: String(describing: UICollectionReusableView.self))
}
