import UIKit

struct VisualEffectViewswithBlurandVibrancyObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIVisualEffectView-Vibrancy")
    var title: String = "visual_effect_views_with_blur_and_vibrancy_title".localize
    var description: String = "visual_effect_views_with_blur_and_vibrancy_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoViewType(name: "UIVisualEffectBlurVibrancy")
}
