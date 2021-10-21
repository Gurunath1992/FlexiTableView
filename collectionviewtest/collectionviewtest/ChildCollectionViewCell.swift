//
//  ChildCollectionViewCell.swift
//  collectionviewtest
//
//  Created by Gurunath Sripad on 10/21/21.
//

import UIKit

class ChildCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tableView: UITableView!
    var shouldShowExtraCell = false
}

extension ChildCollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel?.text = "Grand Child \(indexPath.row)"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shouldShowExtraCell ? 4 : 3
    }
}

extension ChildCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        shouldShowExtraCell = !shouldShowExtraCell
        self.tableView.reloadData()
        let notification = Notification.init(name: .tappedCell, object: shouldShowExtraCell, userInfo: nil)
        NotificationCenter.default.post(notification)
    }
}
