import UIKit

struct VerticalStackViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIStackView-Vertical")
    var title: String = "vertical_stack_view_title".localize
    var description: String = "vertical_stack_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: "UIVerticalStackView")
}
