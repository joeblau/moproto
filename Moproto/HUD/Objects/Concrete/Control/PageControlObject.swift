import UIKit

struct PageControlObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIPageControl")
    var title: String = "page_control_title".localize
    var description: String = "page_control_description".localize
    var category: ObjectCategory = .control
    var type: NSItemProviderWriting = MoprotoControlType(name: String(describing: UIPageControl.self))
}
