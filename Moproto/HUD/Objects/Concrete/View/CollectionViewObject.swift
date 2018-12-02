import UIKit

struct CollectionViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UICollectionView")
    var title: String = "collection_view_title".localize
    var description: String = "collection_view_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoViewType(name: String(describing: UICollectionView.self))
}

