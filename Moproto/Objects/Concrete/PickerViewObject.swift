import UIKit

struct PickerViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIPickerView")
    var title: String = "picker_view_title".localize
    var description: String = "picker_view_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIPickerView.self))
}
