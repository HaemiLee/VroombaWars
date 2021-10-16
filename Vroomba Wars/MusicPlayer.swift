//
//  MusicPlayer.swift
//  Vroomba Wars
//
//  Created by Deka Popov on 4/14/21.
//

import Foundation
import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?
    var audioPlayerSounds: AVAudioPlayer?

    func startBackgroundMusic(backgroundMusicFileName: String) {
        if let bundle = Bundle.main.path(forResource: backgroundMusicFileName, ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                   } catch(let error) {
                       print(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    audioPlayer.play()
                }
            } catch {
                print(error)
            }
        }
    }
    
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
    func stopEffectsMusic() {
        guard let audioPlayerSounds = audioPlayerSounds else { return }
        audioPlayerSounds.stop()
    }
    func playSoundEffect(soundEffect: String) {
        if let bundle = Bundle.main.path(forResource: soundEffect, ofType: "wav") {
            let soundEffectUrl = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayerSounds = try AVAudioPlayer(contentsOf:soundEffectUrl as URL)
                guard let audioPlayerSounds = audioPlayerSounds else { return }
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                   } catch(let error) {
                       print(error.localizedDescription)
                }
                DispatchQueue.global().async {
                    audioPlayerSounds.play()
                }
            } catch {
                print(error)
            }
        }
    }
   }
