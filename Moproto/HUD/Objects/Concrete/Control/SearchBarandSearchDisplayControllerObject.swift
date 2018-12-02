import UIKit

struct SearchBarandSearchDisplayControllerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UISearchDisplayController")
    var title: String = "search_bar_and_search_display_controller_title".localize
    var description: String = "search_bar_and_search_display_controller_description".localize
    var category: ObjectCategory = .controller
    var type: NSItemProviderWriting = MoprotoControlType(name: String(describing: UISearchController.self))
}
