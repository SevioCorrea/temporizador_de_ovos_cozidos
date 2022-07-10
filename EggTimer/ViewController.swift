//
//  ViewController.swift
//  EggTimer
//
//  Created by Sévio Corrêa on 06/07/2022.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer!

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelectes(_ sender: UIButton) {
        
        progressBar.progress = 0.0
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        print(eggTimes[sender.currentTitle!] ?? "Error")
        
        totalTime = eggTimes[sender.currentTitle!]! * 60
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
            
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed < self.totalTime {
                self.secondsPassed += 1
                
                
                self.progressBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
                print(Float(self.secondsPassed) / Float(self.totalTime))
                
            } else {
                Timer.invalidate()
                self.titleLabel.text = "Está pronto."
                
                
                    playSound(soundName: "alarm_sound")
                func playSound(soundName: String) {
                    let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
                    player = try! AVAudioPlayer(contentsOf: url!)
                    player?.play()
                
                }
                
            }
        }
    }
}
