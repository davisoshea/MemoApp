//
//  ViewController.swift
//  MemoApp
//
//  Created by Period 2 on 2/2/17.
//  Copyright © 2017 Period 2. All rights reserved.
//

import UIKit
import AVFoundation

class DisplayNoteViewController: UIViewController, AVAudioPlayerDelegate {
    var audioPlayer:AVAudioPlayer?
    var samplePlayer:AVAudioPlayer?
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        let url = URL.init(fileURLWithPath: Bundle.main.path(
            forResource: "music",
            ofType: "mp3")!)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()

        } catch let error as NSError {
            print("audioPlayer error \(error.localizedDescription)")
        }
        
        let sample = URL.init(fileURLWithPath: Bundle.main.path(
            forResource: "HUH",
            ofType: "wav")!)
        
        do {
            try samplePlayer = AVAudioPlayer(contentsOf: sample)
            samplePlayer?.delegate = self
            samplePlayer?.prepareToPlay()
            
        } catch let error as NSError {
            print("audioPlayer error \(error.localizedDescription)")
        }
        configureDefaultSlider()
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var slider: UISlider!

        
    
    func configureDefaultSlider() {
        slider.minimumValue = 0
        if let player = samplePlayer{
        slider.maximumValue = Float(player.duration)
        }
        slider.value = 0
        slider.isContinuous = true
    }
    
    
    @IBAction func valueCahnged(_ sender: UISlider) {
        label.text = String(sender.value)
    }
    
    
    @IBAction func PlaySample(_ sender: Any) {
        if let player = samplePlayer {
            player.currentTime = 0
            player.play()
            
            
//            timer = Timerwith(timeInterval: (TimeInterval(Float(label.text!)!)), repeats: false, block: { [weak self] (timer) -> Void in
//         if player.currentTime == timer.timeInterval{
//            player.stop()
//                }
//
//            })
            func stopplayer(){
                player.stop()
            }
            
            timer = Timer.scheduledTimer(withTimeInterval: (TimeInterval(Float(label.text!)!)), repeats: false, block: { [weak self] (timer) -> Void in
                            player.stop()
                player.prepareToPlay()
                            })
            if player.isPlaying == false{
                player.play()
            }
        
        }
        else {
            print("audio file is not found")
        }
    }
    
    
    
    @IBAction func Play(_ sender: Any) {
        if let player = audioPlayer {
            player.currentTime = 0
            player.play()
        }
        else {
            print("audio file is not found")
        }
    }
    @IBAction func Stop(_ sender: Any) {
        if let player = audioPlayer {
            player.stop()
        }
        if let player = samplePlayer {
            player.stop()
        }
    
    
    }
    
    
    
}



