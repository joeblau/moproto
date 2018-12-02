import UIKit

struct SearchBarObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UISearchBar")
    var title: String = "search_bar_title".localize
    var description: String = "search_bar_description".localize
    var category: ObjectCategory = .control
    var type: NSItemProviderWriting = MoprotoControlType(name: String(describing: UISearchBar.self))
}
