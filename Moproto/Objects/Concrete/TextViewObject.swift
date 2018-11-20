import UIKit

struct TextViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UITextView")
    var title: String = "text_view_title".localize
    var description: String = "text_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UITextView.self))
}
