import UIKit

struct LabelObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UILabel")
    var title: String = "label_title".localize
    var description: String = "label_description".localize
    var category: ObjectCategory = .viewController
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UILabel.self))
}