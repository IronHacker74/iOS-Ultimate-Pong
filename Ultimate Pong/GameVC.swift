//
//  GameVC.swift
//  Ultimate Pong
//
//  Created by Andrew Masters on 9/15/17.
//  Copyright © 2017 Andrew Masters. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameVC: UIViewController {
    
    var audio_player: SongPlayer!
    
    var scene: GameScene!
    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var pauseMenuImg: UIImageView!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var mainMenuBtn: UIButton!
    @IBOutlet weak var returnToGameBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadScene()
        
        pauseView.isHidden = true;
        audio_player.change_song_title(track_name: "game_track_1")
        audio_player.start_playing_song()
        
    }
    
    func loadScene() {
        
        if let scene = GKScene(fileNamed: "GameScene") {
            
            if let sceneNode = scene.rootNode as! GameScene? {
                
                sceneNode.scaleMode = .aspectFill
                
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                    view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "GameScreen"))
                }
            }
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func pauseBtnPressed(_ sender: UIButton) {
        audio_player.change_volume(to_number: 0.5)
        pauseBtn.isHidden = true
        pauseView.isHidden = false
    }
    
    @IBAction func returnBtnPressed(_ sender: UIButton) {
        audio_player.change_volume(to_number: 4.0)
        pauseBtn.isHidden = false
        pauseView.isHidden = true
    }
}
