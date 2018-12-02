import UIKit

struct ActivityIndicatorViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIActivityIndicatorView")
    var title: String = "activity_indicator_view_title".localize
    var description: String = "activity_indicator_view_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoControlType(name: String(describing: UIActivityIndicatorView.self))
}
