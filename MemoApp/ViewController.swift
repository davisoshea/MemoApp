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
    var audiofile : AVAudioFile!
    var playerNode : AVAudioPlayerNode?
    var audioframe : AVAudioFrameCount!
    
    
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
            try audiofile = AVAudioFile(forReading: sample)
            playerNode = AVAudioPlayerNode.init()
            audioframe = AVAudioFrameCount(audiofile.length)
            print(audioframe)
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
//    @IBAction func tempoChanged(_ sender: UISlider) {
//        interval = sender.value
//    }
    
    @IBAction func valueCahnged(_ sender: UISlider) {
        label.text = String(sender.value)
    }
    
    
    @IBAction func PlaySample(_ sender: Any) {
        if let player = samplePlayer{
//            player.prepareToPlay()
//            let now : TimeInterval = (samplePlayer?.deviceCurrentTime)!;
//            let startDelay : TimeInterval = 0.25;
//            let playtime : TimeInterval = now + startDelay
//            player.play(atTime: playtime)
//            player.prepareToPlay()
            player.play()
            timer = Timer.scheduledTimer(withTimeInterval: (TimeInterval(Float(label.text!)!)) , repeats: false, block: { (timer) in
                player.stop()
                player.prepareToPlay()
            })
            
//            timer = Timer.scheduledTimer(withTimeInterval: (TimeInterval(Float(label.text!)!)) , repeats: false, block: { (timer) in
//                                player.stop()
//                                player.prepareToPlay()
//                            })
            player.currentTime = 0

//            var framestoplay = AVAudioFrameCount(Float(playerNode.sampleRate) * length)
//            playerNode!.scheduleSegment(audiofile, startingFrame: 0, frameCount: AVAudioFrameCount(audiofile.length), at: timer, completionHandler: nil)
//            player.play(atTime: player.currentTime)
            
            
            
            
            
            
            
//            timer = Timerwith(timeInterval: (TimeInterval(Float(label.text!)!)), repeats: false, block: { [weak self] (timer) -> Void in
//         if player.currentTime == timer.timeInterval{
//            player.stop()
//                }
//
//            })
//            timer = Timer.scheduledTimer(withTimeInterval: (TimeInterval(Float(label.text!)!)), repeats: false, block: { [weak self] (timer) -> Void in
//                        player.stop()
//                        player.prepareToPlay()
//                        self?.isplaying = false
//                                })
//            

//            timer = Timer.scheduledTimer(withTimeInterval: (TimeInterval(Float(label.text!)!)), repeats: true, block: { [weak self] (timer) -> Void in
//                player.play()
//                player.prepareToPlay()
//            })
//            if isplaying == false{
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
//                    player.currentTime = 0
//                    player.play()
//                    
//                })
//            }
//
            
    
        }
        else {
            print("audio file is not found")
        }
    }
    
    
    
    @IBAction func Play(_ sender: Any) {
        if let player = audioPlayer {
            player.currentTime = 0
            player.enableRate=true
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



