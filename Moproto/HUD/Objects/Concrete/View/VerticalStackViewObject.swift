import UIKit

struct VerticalStackViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIStackView-Vertical")
    var title: String = "vertical_stack_view_title".localize
    var description: String = "vertical_stack_view_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoViewType(name: "UIVerticalStackView")
}
