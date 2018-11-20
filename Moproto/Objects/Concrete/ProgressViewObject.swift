import UIKit

struct ProgressViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIProgressView")
    var title: String = "progress_view_title".localize
    var description: String = "progress_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIProgressView.self))
}
