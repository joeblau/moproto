import UIKit

struct WebkitViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "WKWebView")
    var title: String = "webkit_view_title".localize
    var description: String = "webkit_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: "WKWebView")
}
