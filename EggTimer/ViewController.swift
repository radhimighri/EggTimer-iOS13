//
//  ViewController.swift
//  EggTimer
//
//  Created by Radhi Mighri on 08/07/2020.
//  Copyright © 2020 Radhi Mighri. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
  
    func playSound() {
           let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
           
       }
    @IBOutlet weak var progressBarView: UIProgressView!
    
    @IBOutlet weak var labelVIEW: UILabel!
    
var countTimer:Timer!
var timer = Timer()
    
    let eggTime = ["Soft":6, "Medium":420,"Hard":720]
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBarView.progress = 0.0

    }
    @IBAction func hardnessSelected(_ sender: UIButton) {
//        print("You have selected the \(String(describing: sender.currentTitle)) Egg ")
        timer.invalidate() // stop and cancel our timer every time we press the button
        let hardness =  sender.currentTitle! // ! here to remove the 1st Optional word because we are sure that all of our buttons have a title
        //_  =  sender.currentTitle  : if we didnt use the variable
        
        //print(eggTime[hardness]!) // ! here to remove the 2nd Optional word .because we are sure that hardness values exist in the dicionary
    
//        switch hardeness {
//        case "Soft":
//            print("softTime")
//        case "Medium":
//            print("Medium")
//        default:
//            print("Hard")
//        }
        
        labelVIEW.text = sender.currentTitle
        
        var passedTime = 0
        let totalTime = eggTime[hardness]!

            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if passedTime < totalTime {
//                    print ("\(totalTime) seconds")
                    passedTime += 1
                    let percentageProgress = Float(passedTime) / Float(totalTime)
                   
                    print(percentageProgress)
                    self.progressBarView.progress = Float(percentageProgress)
                    } else {
                    self.timer.invalidate()
                    self.labelVIEW.text = "Done :) "
                    self.playSound()
                    
                }
        }
       


    }
    
}
