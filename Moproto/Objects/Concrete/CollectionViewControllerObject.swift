import UIKit

struct CollectionViewControllerObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UICollectionViewController")
    var title: String = "collection_view_controller_title".localize
    var description: String = "collection_view_controller_description".localize
    var category: ObjectCategory = .viewController
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UICollectionViewController.self))
}
