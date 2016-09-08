//
//  ViewController.swift
//  SimonSaysLab
//
//  Created by James Campagno on 5/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayColorView: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    var simonSaysGame = SimonSays()
    var buttonsClicked = 0
    
    @IBAction func greenColor(sender: AnyObject) {
        buttonsClicked += 1

      simonSaysGame.guessGreen()
        if buttonsClicked >= 5 {
            game()
            
        }
        
    }
    @IBAction func yellowColor(sender: AnyObject) {
        buttonsClicked += 1

        simonSaysGame.guessYellow()
        if buttonsClicked >= 5 {
            game()
          
        }

    }
    
    @IBAction func redColor(sender: AnyObject) {
        buttonsClicked += 1
        simonSaysGame.guessRed()
        if buttonsClicked >= 5 {
            game()
            
        }

        
    }
    
    @IBAction func blueColor(sender: AnyObject) {
        buttonsClicked += 1
        simonSaysGame.guessBlue()
        if buttonsClicked >= 5 {
            game()
          
        }

        
    }
    
    func game(){
        if(simonSaysGame.wonGame()==true){
                winLabel.hidden=false
                winLabel.text="You Won!"
            
            }else {
                winLabel.hidden=false
                winLabel.text="Nope, try again"
            simonSaysGame.tryAgainWithTheSamePattern()

            }
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.hidden = true
    }
}

// MARK: - SimonSays Game Methods
extension ViewController {
    
    @IBAction func startGameTapped(sender: UIButton) {
        UIView.transitionWithView(startGameButton, duration: 0.9, options: .TransitionFlipFromBottom , animations: {
            self.startGameButton.hidden = true
            }, completion: nil)
        
        displayTheColors()
    }
    
    private func displayTheColors() {
        self.view.userInteractionEnabled = false
        UIView.transitionWithView(displayColorView, duration: 1.5, options: .TransitionCurlUp, animations: {
            self.displayColorView.backgroundColor = self.simonSaysGame.nextColor()?.colorToDisplay
            self.displayColorView.alpha = 0.0
            self.displayColorView.alpha = 1.0
            }, completion: { _ in
                if !self.simonSaysGame.sequenceFinished() {
                    self.displayTheColors()
                } else {
                    self.view.userInteractionEnabled = true
                    print("Pattern to match: \(self.simonSaysGame.patternToMatch)")
                }
        })
    }
}
