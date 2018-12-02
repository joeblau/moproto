import UIKit

struct SpritekitViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "SKView")
    var title: String = "spritekit_view_title".localize
    var description: String = "spritekit_view_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoViewType(name: "SKView")
}
