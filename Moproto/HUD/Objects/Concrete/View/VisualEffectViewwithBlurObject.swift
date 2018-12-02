import UIKit

struct VisualEffectViewwithBlurObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIVisualEffectView")
    var title: String = "visual_effect_view_with_blur_title".localize
    var description: String = "visual_effect_view_with_blur_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoViewType(name: "UIVisualEffectBlurVibrancy")
}
