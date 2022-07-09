//
//  ViewController.swift
//  EggTimer
//
//  Created by Sévio Corrêa on 06/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12]
    
    var timer = Timer()
    
    @IBAction func hardnessSelectes(_ sender: UIButton) {
        
        timer.invalidate()
        
        print(eggTimes[sender.currentTitle!] ?? "Error")
        
        var secondsRemaining = eggTimes[sender.currentTitle!]! * 60
            
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                print ("\(secondsRemaining) seconds")
                secondsRemaining -= 1
            } else {
                Timer.invalidate()
                self.titleLabel.text = "Está pronto."
            }
        }
    }
}
