//
//  ViewController.swift
//  Destini
//
//  Created by Maksim Pansevich on 05/12/19.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var Story: [StoryData] = []
    var currentStory: StoryData = StoryData(text: "", answerAText: "", answerBText: "")
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Story data storing
        Story.append(StoryData(text: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\".", answerAText: "I\'ll hop in. Thanks for the help!", answerBText: "Better ask him if he\'s a murderer first."))
        
        Story.append(StoryData(text: "He nods slowly, unphased by the question.", answerAText: "At least he\'s honest. I\'ll climb in.", answerBText: "Wait, I know how to change a tire."))
        
        Story.append(StoryData(text: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.", answerAText: "I love Elton John! Hand him the cassette tape.", answerBText: "It\'s him or me! You take the knife and stab him."))
        
        Story.append(StoryData(text: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?", answerAText: "", answerBText: ""))
        
        Story.append(StoryData(text: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.", answerAText: "", answerBText: ""))
        
        Story.append(StoryData(text: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"", answerAText: "", answerBText: ""))
        
        
        // Story tree creating
        Story[0].nextStoryA = Story[2]
        Story[0].nextStoryB = Story[1]
        Story[1].nextStoryA = Story[2]
        Story[1].nextStoryB = Story[3]
        Story[2].nextStoryA = Story[5]
        Story[2].nextStoryB = Story[4]
        
        currentStory = Story[0]
        
        updateUI()
        
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == 1{
            
            currentStory = currentStory.nextStoryA ?? currentStory
            
        }
        else if sender.tag == 2{
            
            currentStory = currentStory.nextStoryB ?? currentStory
            
        }
        
        updateUI()
    
    }
    
    func updateUI() {
        
        storyTextView.text = currentStory.storyText
        topButton.setTitle(currentStory.answerA, for: .normal)
        bottomButton.setTitle(currentStory.answerB, for: .normal)
        
        if topButton.currentTitle == ""{
            topButton.frame.size.height = 0
            topButton.frame.size.width = 0
        }
        if bottomButton.currentTitle == ""{
            bottomButton.frame.size.height = 0
            bottomButton.frame.size.width = 0
        }
        
    }
    



}

