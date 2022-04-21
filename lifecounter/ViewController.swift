//
//  ViewController.swift
//  lifecounter
//
//  Created by Henry Bao on 4/20/22.
//

import UIKit

class ViewController: UIViewController {

    var playerOneHp = 20
    var playerTwoHp = 20
    
    
    @IBOutlet weak var playerLoseLabel: UILabel!
    
    // Player 1
    @IBOutlet weak var playerOneHpLabel: UILabel!

    @IBOutlet weak var playerOneMinusFive: UIButton!
    @IBOutlet weak var playerOneMinusOne: UIButton!
    @IBOutlet weak var playerOnePlusOne: UIButton!
    @IBOutlet weak var playerOnePlusFive: UIButton!
    
    // Player 2
    @IBOutlet weak var playerTwoHpLabel: UILabel!

    @IBOutlet weak var playerTwoMinusFive: UIButton!
    @IBOutlet weak var playerTwoMinusOne: UIButton!
    @IBOutlet weak var playerTwoPlusOne: UIButton!
    @IBOutlet weak var playerTwoPlusFive: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerLoseLabel.text = ""
    }

    @IBAction func updatePlayerScore(sender: UIButton) {
        switch sender {
        case playerOneMinusOne:
            playerOneHp -= 1
            break
        case playerOneMinusFive:
            playerOneHp -= 5
            break
        case playerOnePlusOne:
            playerOneHp += 1
            break
        case playerOnePlusFive:
            playerOneHp += 5
            break
        case playerTwoMinusOne:
            playerTwoHp -= 1
            break
        case playerTwoMinusFive:
            playerTwoHp -= 5
            break
        case playerTwoPlusOne:
            playerTwoHp += 1
            break
        case playerTwoPlusFive:
            playerTwoHp += 5
            break
        default:
            break
        }
        updateHpLabel()
    }

    func updateHpLabel() {
        playerOneHpLabel.text = "\(playerOneHp)"
        playerTwoHpLabel.text = "\(playerTwoHp)"
        if playerOneHp <= 0 {
            playerLoseLabel.text = "Player 1 LOSES!"
        } else if playerTwoHp <= 0 {
            playerLoseLabel.text = "PLayer 2 LOSES!"
        } else {
            playerLoseLabel.text = ""
        }
    }
}

