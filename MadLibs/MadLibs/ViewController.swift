//
//  ViewController.swift
//  MadLibs
//
//  Created by J A on 2020-06-21.
//  Copyright © 2020 JAFZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var numberOfPets: UILabel!
    
    @IBOutlet weak var animalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    @IBOutlet weak var happyEndingSwitch: UISwitch!
    
    @IBOutlet weak var containerView: UIView!
    @IBAction func lessOrMoreValueDidChanged(_ sender: UISegmentedControl) {
        //If user taps on less-> hide the container view
        if sender.selectedSegmentIndex == 0 {
            containerView.isHidden = true
            //If user taps on more-> show the container view
        }else if sender.selectedSegmentIndex == 1 {
            containerView.isHidden = false
        }
    }
    
    
    @IBAction func sliderDidChanged(_ sender: UISlider) {
        //Update the label on the left of the slider base on the current value
        numberLabel.text = "\(Int(sender.value))"   }
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        //update the label on the left of the stepper based on the current value
        //of the stepper object
        numberOfPets.text = "\(Int(sender.value))"
    }
    
    @IBAction func createStoryDidTapped(_ sender: UIButton) {
        //At the age of 21, Bob took a trip to Austin  with 3 pets in order to sing with a moose. Bob decided to buy 42. Now they live happily ever after.
        
        let animal = animalSegmentedControl.titleForSegment(at: animalSegmentedControl.selectedSegmentIndex)
        //ternary operator
        let happyEnding = happyEndingSwitch.isOn ? "Now they live happily ever after." : "Things didn't turned out too well."
        let story = "At the age of \(ageTextField.text!), \(firstNameTextField.text!) took a trip to \(locationTextField.text!)  with \(Int(numberOfPetsStepper.value)) pet(s) in order to \(verbTextField.text!) with a \(animal!). \(firstNameTextField.text!) decided to buy \(Int(numberSlider.value)). \(happyEnding)"
        print(story)
        
        //Reset
        func reset() {
            firstNameTextField.text = ""
            locationTextField.text = ""
            verbTextField.text = ""
            ageTextField.text = ""
            numberLabel.text = "42"
            numberOfPets.text = "3"
            animalSegmentedControl.selectedSegmentIndex = 0
            numberSlider.value = 42
            happyEndingSwitch.isOn = true
            
        }
        
        //Pop up that shows the story
        let alertController = UIAlertController(title: "My Story", message: story, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        reset()
        present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    
    
}

