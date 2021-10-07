//
//  MusicPlayer.swift
//  Ultimate Pong
//
//  Created by Andrew Masters on 10/6/21.
//  Copyright © 2021 Andrew Masters. All rights reserved.
//

import Foundation
import AVFoundation

/*
 MARK: - Song Player
        Creates a player for the music with the track name as argument
 */

class SongPlayer {
    private var musicPlayer: AVAudioPlayer!

    init(track_name: String) {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: track_name, ofType: "mp3")!)
        
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try! AVAudioSession.sharedInstance().setActive(true)
        
        try! musicPlayer = AVAudioPlayer(contentsOf: path)
        musicPlayer!.prepareToPlay()
        musicPlayer.volume = 4.0
    }
    
    func change_song_title(track_name: String){
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: track_name, ofType: "mp3")!)
        try! musicPlayer = AVAudioPlayer(contentsOf: path)
        musicPlayer!.prepareToPlay()
    }
    
    func change_volume(to_number: Float){
        musicPlayer.volume = to_number;
    }
    
    func start_playing_song(){
        musicPlayer!.play()
    }
    
    func stop_playing_song(){
        musicPlayer!.stop()
    }
}


