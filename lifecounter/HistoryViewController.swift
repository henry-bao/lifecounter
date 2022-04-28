//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Henry Bao on 4/28/22.
//

import UIKit
class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gameHistoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameHistoryTable.delegate = self
        gameHistoryTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameHistory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gameHistoryTable.dequeueReusableCell(withIdentifier: "History Cell")
        cell?.textLabel?.text = gameHistory[indexPath.row]
        return cell!
    }
}
