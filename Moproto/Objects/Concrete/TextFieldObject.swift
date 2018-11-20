import UIKit

struct TextFieldObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UITextField")
    var title: String = "text_field_title".localize
    var description: String = "text_field_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UITextField.self))
}
