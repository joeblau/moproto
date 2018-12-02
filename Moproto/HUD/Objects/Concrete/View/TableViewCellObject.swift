import UIKit

struct TableViewCellObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UITableViewCell")
    var title: String = "table_view_cell_title".localize
    var description: String = "table_view_cell_description".localize
    var category: ObjectCategory = .view
    var type: NSItemProviderWriting = MoprotoViewType(name: String(describing: UITableViewCell.self))
}
