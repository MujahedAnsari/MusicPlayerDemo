//
//  ViewController.swift
//  MusicPlayerDemo
//
//  Created by Mujahed Ansari on 21/12/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
        // Do any additional setup after loading the view.
    }

    func playMusic(){
      
        let path = Bundle.main.path(forResource: "findPhoneRingtune", ofType : "mp3")!
        let url = URL(fileURLWithPath : path)
            do {
                
                 player = try AVAudioPlayer(contentsOf: url)
                try AVAudioSession.sharedInstance().setCategory(.playAndRecord)
            } catch {
                print ("There is an issue with this code!")
            }
        DispatchQueue.main.async {
            //self.player.delegate = self
            self.player.numberOfLoops = 5
          //  self.player.prepareToPlay()
            self.player.play()
        }
    }
}

extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(flag)
    }
    
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        print("audioPlayerBeginInterruption")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("audioPlayerDecodeErrorDidOccur")
    }
    
    func audioPlayerEndInterruption(_ player: AVAudioPlayer, withOptions flags: Int) {
        print("audioPlayerEndInterruption")
    }
    
}
