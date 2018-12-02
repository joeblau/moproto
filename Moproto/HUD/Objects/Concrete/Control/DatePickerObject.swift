import UIKit

struct DatePickerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIDatePicker")
    var title: String = "date_picker_title".localize
    var description: String = "date_picker_description".localize
    var category: ObjectCategory = .control
    var type: NSItemProviderWriting = MoprotoControlType(name: String(describing: UIDatePicker.self))
}
