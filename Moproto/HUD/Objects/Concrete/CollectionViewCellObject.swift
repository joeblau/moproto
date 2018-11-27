import UIKit

struct CollectionViewCellObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UICollectionViewCell")
    var title: String = "collection_view_cell_title".localize
    var description: String = "collection_view_cell_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UICollectionViewCell.self))
}
