//
//  ViewController.swift
//  multiplierApp
//
//  Created by Jaime Andres Lopez Mora on 6/04/16.
//  Copyright © 2016 Click Delivery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //properties
    var comparisonLimit:Int = 50
    var currentSum:Int = 0
    var multiple:Int = 0
    
    //outlets
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var multipleTextField: UITextField!
    @IBOutlet weak var appTitleImageView: UIImageView!
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        appTitleImageView.hidden = false
        multipleTextField.hidden = false
        playButton.hidden = false
        sumLabel.hidden = true
        addButton.hidden = true
        
        sumLabel.text = "Click 'Add' to add"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPlayButtonTapped(sender: AnyObject) {
        if multipleTextField.text != nil && multipleTextField.text != "" {
            
            multiple = Int(multipleTextField.text!)!
            
            if multiple <= 0 {
                let alert:UIAlertController = UIAlertController(title: "Watch out!", message: "The multiple can only be a positive integer", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                multipleTextField.text = ""
            }
            else {
                toggleUI()
                updateSumLabel()
            }
        }
        else {
            let alert:UIAlertController = UIAlertController(title: "Watch out!", message: "You have to specify a multiple to add by", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    @IBAction func onAddButtonTapped(sender: AnyObject) {
        currentSum += multiple
        updateSumLabel()
        
        if currentSum >= comparisonLimit {
            restartGame()
        }
    }
    
    func updateSumLabel() {
        if currentSum == 0 {
            sumLabel.text = "Click 'Add' to add"
        }
        else {
            sumLabel.text = "\(currentSum-multiple) + \(multiple) = \(currentSum)"
        }
    }
    
    func toggleUI() {
        appTitleImageView.hidden = !appTitleImageView.hidden
        multipleTextField.hidden = !multipleTextField.hidden
        playButton.hidden = !playButton.hidden
        sumLabel.hidden = !sumLabel.hidden
        addButton.hidden = !addButton.hidden
    }
    
    func isGameOver() -> Bool {
        if(currentSum >= comparisonLimit) {
            return true
        }
        
        return false
    }
    
    func restartGame() {
        multipleTextField.text = ""
        currentSum = 0
        multiple = 0
        
        toggleUI()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

