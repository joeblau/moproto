import UIKit

struct WebkitViewObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "WKWebView")
    var title: String = "webkit_view_title".localize
    var description: String = "webkit_view_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoViewType(name: "WKWebView")
}
