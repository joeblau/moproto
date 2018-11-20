import UIKit

struct SwitchObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UISwitch")
    var title: String = "switch_title".localize
    var description: String = "switch_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UISwitch.self))
}
