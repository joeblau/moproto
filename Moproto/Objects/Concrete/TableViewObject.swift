import UIKit

struct TableViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UITableView")
    var title: String = "table_view_title".localize
    var description: String = "table_view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UITableView.self))
}
