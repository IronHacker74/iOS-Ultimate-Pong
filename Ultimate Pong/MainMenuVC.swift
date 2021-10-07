//
//  MainMenuVC.swift
//  Ultimate Pong
//
//  Created by Andrew Masters on 9/14/17.
//  Copyright © 2017 Andrew Masters. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
import GameKit

class MainMenuVC: UIViewController {
        
    var audio_player = SongPlayer.init(track_name: "menu_track")
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var settingsMenu: UIView!
    @IBOutlet weak var blurEffect:UIVisualEffectView!
    
    var scene: MainScene!
    var settingsIsOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        blurEffect.layer.cornerRadius = 25
        blurEffect.isHidden = true
        
        loadBackground()
        
        audio_player.start_playing_song()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func loadBackground() {
        let skView: SKView = self.view as! SKView
        skView.allowsTransparency = true
        scene = MainScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
    func newSmokeEmitter() -> SKEmitterNode {
        return SKEmitterNode(fileNamed: "Smoke.sks")!
    }
    
    @IBAction func volumeSliderMoved(_ sender: UISlider) {
        audio_player.change_volume(to_number: volumeSlider.value)
    }
    
    @IBAction func playSetupBtnPressed(_ sender: UIButton) {
        //MARK: - Currently pushing straight to game - change to add setup menu
        audio_player.stop_playing_song()
        performSegue(withIdentifier: "gameViewSegue", sender: nil)
    }

    @IBAction func multiplayerBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "MultiplayerSetupVCSegue", sender: nil)
    }

    @IBAction func controlsBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func settingsBtnPressed(_ sender: UIButton) {
        if settingsIsOpen {
            settingsIsOpen = false
            blurEffect.isHidden = true
        } else {
            settingsIsOpen = true
            blurEffect.isHidden = false

        }
    }
    
    @IBAction func exitSettingsBtnPressed(_ sender: UIButton) {
        blurEffect.isHidden = true
        settingsIsOpen = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? GameSetupVC {
            destinationVC.audio_player = audio_player
        }
        if let destinationVC = segue.destination as? GameVC {
            destinationVC.audio_player = audio_player
        }
    }
    
}

