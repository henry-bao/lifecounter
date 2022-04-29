//
//  ViewController.swift
//  lifecounter
//
//  Created by Henry Bao on 4/20/22.
//

import UIKit

var gameHistory: [String] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var allPlayers: [Player] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        numberSliderLabel.text = "\(Int(numberSlider.value))"
        playerTable.delegate = self
        playerTable.dataSource = self
        restartGame()
    }
    
    @IBOutlet weak var addPlayerButton: UIButton!
    @IBOutlet weak var numberSliderLabel: UILabel!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var playerTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PlayerTableCell = playerTable.dequeueReusableCell(withIdentifier: "Player Cell") as! PlayerTableCell
        cell.name.text = allPlayers[indexPath.row].name
        cell.health.text = String(allPlayers[indexPath.row].health)
        return cell
    }

    @IBAction func numberSliderAction(_ sender: Any) {
        let step: Float = 1
        let roundedValue = round(numberSlider.value / step) * step
        numberSlider.value = roundedValue
        numberSliderLabel.text = "\(Int(numberSlider.value))"
    }
    
    @IBAction func healthModifierButtonClicked(_ sender: Any) {
        let selectedIndex = playerTable.indexPathForSelectedRow
        if selectedIndex == nil {
            return
        }
        let selectedCell = playerTable.cellForRow(at: selectedIndex!) as! PlayerTableCell
        let playerName = selectedCell.name!.text
        let player = allPlayers.filter { $0.name == playerName }
        if (sender as! UIButton) == addButton {
            player[0].add(healthToAdd: Int(numberSlider.value))
            gameHistory.append("\(player[0].name) gained \(Int(numberSlider.value)) health")
        } else {
            player[0].subtract(healthToSubtract: Int(numberSlider.value))
            gameHistory.append("\(player[0].name) lost \(Int(numberSlider.value)) health")
        }
        reloadTableData(player: player[0])
    }
    
    @IBAction func restartButtonClicked(_ sender: Any) {
        restartGame()
    }
    
    @IBAction func addPlayerButtonClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Add Player", message: "Enter player name", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Player Name"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            if textField?.text != "" {
                self.allPlayers.append(Player(name: textField!.text!, health: 20))
                self.reloadTableData(player: self.allPlayers[self.allPlayers.count - 1])
            }
            gameHistory.append("\(textField!.text!) was added")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func restartGame() {
        allPlayers = [
            Player(name: "Player 1", health: 20),
            Player(name: "Player 2", health: 20),
            Player(name: "Player 3", health: 20),
            Player(name: "Player 4", health: 20)
        ]
        gameHistory = ["Game Started!"]
        reloadTableData(player: allPlayers[0])
    }
    
    func reloadTableData(player: Player) {
        playerTable.reloadData()
        addButton.isEnabled = true
        minusButton.isEnabled = true
        numberSlider.isEnabled = true
        addPlayerButton.isEnabled = true
        if (player.health <= 0) {
            player.name += " LOSES!"
            gameHistory.append("Game Over! \(player.name)")
            addButton.isEnabled = false
            minusButton.isEnabled = false
            numberSlider.isEnabled = false
            addPlayerButton.isEnabled = false

            let alert = UIAlertController(title: "Game Over", message: "\(player.name)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in
                self.restartButtonClicked(self)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
