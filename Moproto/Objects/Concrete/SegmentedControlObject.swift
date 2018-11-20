import UIKit

struct SegmentedControlObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UISegmentedControl")
    var title: String = "segmented_control_title".localize
    var description: String = "segmented_control_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UISegmentedControl.self))
}
