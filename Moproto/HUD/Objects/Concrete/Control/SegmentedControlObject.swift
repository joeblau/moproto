import UIKit

struct SegmentedControlObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UISegmentedControl")
    var title: String = "segmented_control_title".localize
    var description: String = "segmented_control_description".localize
    var category: ObjectCategory = .control
    var type: NSItemProviderWriting = MoprotoControlType(name: String(describing: UISegmentedControl.self))
}
