//
//  ViewController.swift
//  EnableTextFieldDemo
//
//  Created by Adrian Bolinger on 1/2/17.
//  Copyright © 2017 Adrian Bolinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this is the initial setting, as your textfield is presumambly blank
        configureTextFields()
        configureDismissKeyboard()
        updateTextField()
    }
    
    // MARK: - Configuration Methods
    func configureTextFields() {
        // create an array of textfields
        let textFieldArray = [firstNameTextField, lastNameTextField, phoneNumberTextField]
        
        // configure them...
        for textField in textFieldArray {
            // make sure you set the delegate to be self
            textField?.delegate = self
            // add a target to them
            textField?.addTarget(self, action: #selector(ViewController.updateTextField), for: .editingChanged)
        }
    }
    
    func configureDismissKeyboard() {
        // creates a gesture recognizer that calls dismissKeyboard and adds to the view
        let tapToDismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tapToDismissKeyboard)
    }
    
    // this is the target that gets called when editing changes
    func updateTextField() {
        // create an array of textFields
        let textFields = [firstNameTextField, lastNameTextField, phoneNumberTextField]
        // create a bool to test if a textField is blank in the textFields array
        let oneOfTheTextFieldsIsBlank = textFields.contains(where: {($0?.text ?? "").isEmpty})
        if oneOfTheTextFieldsIsBlank {
            continueButton.isEnabled = false
            continueButton.alpha = 0.5
            print("** One of the textFields is blank **\ncontinueButton.isEnabled == false")
        } else {
            continueButton.isEnabled = true
            continueButton.alpha = 1.0
            print("** continueButton.isEnabled == true")
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Button Actions
    
    @IBAction func continueButtonAction(_ sender: UIButton) {
        print("continueButton can do something")
    }
    
}

// MARK: - UITextFieldDelegate Methods
// you can also put UITextFieldDelegate after UIViewController and tuck the methods inside that class. I like to keep delegate methods in extensions for readability
extension ViewController: UITextFieldDelegate {
    // you can fill this in if you need any delegate methods.
}

