import UIKit

struct LabelObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UILabel")
    var title: String = "label_title".localize
    var description: String = "label_description".localize
    var category: ObjectCategory = .viewController
    var type: NSItemProviderWriting = MoprotoViewType(name: String(describing: UILabel.self))
}
