import UIKit

struct HorizontalStackViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIStackView")
    var title: String = "horizontal_stack_view_title".localize
    var description: String = "horizontal_stack_view_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoViewType(name: "UIHorizontalStackView")
}
