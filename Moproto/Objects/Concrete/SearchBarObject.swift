import UIKit

struct SearchBarObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UISearchBar")
    var title: String = "search_bar_title".localize
    var description: String = "search_bar_description".localize
    var category: ObjectCategory = .control
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UISearchBar.self))
}
