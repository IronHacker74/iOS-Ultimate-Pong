//
//  Constants.swift
//  Ultimate Pong
//
//  Created by Andrew Masters on 9/15/17.
//  Copyright © 2017 Andrew Masters. All rights reserved.
//

import Foundation

var pickerViewCategories = Array<Array<String>>()

//AI Difficulty
var aiDifficultyPicked: String!
var aiDifficulty = ["--AI--", "Easy", "Default", "Hard"]

//Side Player Will Play
var playerSidePicked: String!
var playerSide = ["-Side-", "Left", "Right"]

//Arena Color
var arenaColorPicked: String!
var arenaColor = ["-Arena-", "Default"]

//Power Ups
var powerUpsPicked: String!
var powerUps = ["-PowerUps-", "on", "Off"]

//Lights Color
var lightsColorPicked: String!
var lightsColor = ["-Lights-", "White", "Black"]


func populatePickerViewCategories() {
    pickerViewCategories.append(aiDifficulty)
    pickerViewCategories.append(arenaColor)
    pickerViewCategories.append(playerSide)
    pickerViewCategories.append(powerUps)
    //pickerViewCategories.append(lightsColor)
}
