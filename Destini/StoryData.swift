//
//  StoryData.swift
//  Destini
//
//  Created by Maksim Pansevich on 5/12/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation


class StoryData {
    
    var storyText: String
    var answerA: String
    var answerB: String
    var nextStoryA: StoryData?
    var nextStoryB: StoryData?
    
    init(text: String, answerAText: String, answerBText: String) {
        storyText = text
        answerA = answerAText
        answerB = answerBText
    }
}
