import UIKit

struct AvkitPlayerViewControllerObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "AVPlayerViewController")
    var title: String = "avkit_player_view_controller_title".localize
    var description: String = "avkit_player_view_controller_description".localize
    var category: ObjectCategory = .viewController
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: "UIAvkitPlayerViewController"))
}
