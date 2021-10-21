//
//  ViewController.swift
//  collectionviewtest
//
//  Created by Gurunath Sripad on 10/21/21.
//

import UIKit

extension Notification.Name {
    static let tappedCell = Notification.Name("tappedCell")
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var shouldShowBig = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didTapGrandChild(_:)),
                                               name: Notification.Name.tappedCell,
                                               object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "shouldExpandCell"), object: nil)
    }
    
    @objc
       private func didTapGrandChild(_ notification: NSNotification) {
        shouldShowBig = notification.object as! Bool
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellHoldingCollectionVIew")!
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell")!
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            if shouldShowBig {
                return 300
            } else {
                return 240
            }
        } else {
            return 44
        }
        
    }
}
