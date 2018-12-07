//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var player: AVAudioPlayer!
    let soundArray: [String] = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        let selectedSoundFileName: String = soundArray[sender.tag - 1]
        playSound(soundFile: selectedSoundFileName)
    }

    func playSound(soundFile: String) {
        let soundFile = Bundle.main.url(forResource: soundFile, withExtension: "wav")!
        do {
            player = try AVAudioPlayer(contentsOf: soundFile)
            guard player != nil else {
                return
            }
            player.prepareToPlay()
        } catch let error {
            print(error)
        }
        player.play()
    }
}

