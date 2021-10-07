//
//  GameSetupVC.swift
//  Ultimate Pong
//
//  Created by Andrew Masters on 9/15/17.
//  Copyright © 2017 Andrew Masters. All rights reserved.
//


import UIKit
import AVFoundation

class GameSetupVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var audio_player: SongPlayer!
    
    @IBOutlet weak var stepperLbl: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populatePickerViewCategories()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.setValue(UIColor.white, forKey: "textColor")
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerViewCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        for index in 0...pickerViewCategories.count - 1 {
            if component == index {
                return pickerViewCategories[index].count
            }
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        for index in 0...pickerViewCategories.count - 1 {
            if component == index {
                return pickerViewCategories[index][row]
            }
        }
        return "ERROR"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row != 0 {
            loadPicked(component: component, row: row)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        for index in 0...pickerViewCategories.count - 1 {
            if component == index {
                return NSAttributedString(string: pickerViewCategories[index][row], attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])

            }
        }
        let error = NSAttributedString(string: "Error")
        return error
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperLbl.text = Int(sender.value).description
    }
    
    @IBAction func startGameBtnPressed(_ sender: UIButton) {
//        musicPlayer.stop()
        performSegue(withIdentifier: "GameVCSegue", sender: nil)
        
        pickerViewCategories = Array<Array<String>>()
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
        pickerViewCategories = Array<Array<String>>()
    }
    
    func loadPicked(component: Int, row: Int) {
        if component == 0 {
            aiDifficultyPicked = pickerViewCategories[0][row]
        }
        if component == 1 {
            arenaColorPicked = pickerViewCategories[1][row]
        }
        if component == 2 {
            playerSidePicked = pickerViewCategories[2][row]
        }
        if component == 3 {
            powerUpsPicked = pickerViewCategories[3][row]
        }
//        if component == 5 {
//            lightsColorPicked = pickerViewCategories[5][row]
//        }
    }
}
