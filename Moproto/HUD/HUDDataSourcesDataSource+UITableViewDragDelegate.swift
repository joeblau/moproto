//
//  HUDDataSourcesDataSource+UITableViewDragDelegate.swift
//  Moproto
//
//  Created by Joe Blau on 11/25/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

extension HUDDataSourcesDataSource: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [dataSources[indexPath.row].dragItem]
    }
    
    func tableView(_ tableView: UITableView, dragSessionWillBegin session: UIDragSession) {
        tableView.window?.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
        return true
    }
}
