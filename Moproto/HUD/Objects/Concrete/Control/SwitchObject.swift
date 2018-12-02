import UIKit

struct SwitchObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UISwitch")
    var title: String = "switch_title".localize
    var description: String = "switch_description".localize
    var category: ObjectCategory = .control
    var type: NSItemProviderWriting = MoprotoControlType(name: String(describing: UISwitch.self))
}
