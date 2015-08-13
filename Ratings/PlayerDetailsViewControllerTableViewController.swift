//
//  PlayerDetailsViewControllerTableViewController.swift
//  Ratings
//
//  Created by Edwin Guzman Marte on 8/11/15.
//  Copyright (c) 2015 EdGuz. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    var game: String = "Chess"
    
    //Property
    var player: Player!
    
    required init(coder aDecoder: NSCoder) {
        println("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = game
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func selectedGame(segue: UIStoryboardSegue) {
        if let gamePickerViewController = segue.sourceViewController as? GamePickerViewController, selectedGame = gamePickerViewController.selectedGame {
            
            detailLabel.text = selectedGame
            game = selectedGame
        }
    
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text, game: game, rating: 1)
        }
        println(segue.identifier)
        if segue.identifier == "PickGame" {
            if let gamePickerViewController = segue.destinationViewController as? GamePickerViewController {
                gamePickerViewController.selectedGame = game
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        println("deinit PlayerDetailsViewController")
    }

    
}
