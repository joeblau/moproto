import UIKit

struct VisualEffectViewwithBlurObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIVisualEffectView")
    var title: String = "visual_effect_view_with_blur_title".localize
    var description: String = "visual_effect_view_with_blur_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: "UIVisualEffectBlurVibrancy")
}
