import UIKit

struct ImageViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIImageView")
    var title: String = "image_view_title".localize
    var description: String = "image_view_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoViewType(name: String(describing: UIImageView.self))
}
