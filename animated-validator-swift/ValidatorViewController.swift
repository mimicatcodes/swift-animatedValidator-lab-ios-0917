//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    var fields:[UITextField]!
    var counter = 0
    var redColor = UIColor.red
    var whiteColor = UIColor.white
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
      
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    @IBAction func emailTapped(_ sender: UITextField) {
        guard let email = emailTextField.text, email != "" else{
            print("email is not correct")
            return
        }
        if emailTextField.text!.contains("@") {

        counter += 1
            emailTextField.backgroundColor = whiteColor
        } else {
            emailTextField.backgroundColor = redColor
        }

        if counter == 5 {
            submitButton.isEnabled = true
        }
    }
    
    @IBAction func emailConfirmTapped(_ sender: UITextField) {
        guard let emailConfirm = emailConfirmationTextField.text, emailConfirm != "" else {
            print("email is empty")
            return
        }
        if emailConfirm == emailTextField.text {
         counter += 1
         emailConfirmationTextField.backgroundColor = whiteColor
        } else {
         emailConfirmationTextField.backgroundColor = redColor
        }
     
        if counter == 5 {
            submitButton.isEnabled = true
        }
    }
    @IBAction func phoneTapped(_ sender: AnyObject) {
      
        guard let phone = phoneTextField.text, phone != "" else {
            print("phone is empty")
            return
        }
        
        let phoneCharacters = Array(phoneTextField.text!.characters)
        let countPhone = phoneCharacters.count
        
        if countPhone >= 7 {
             counter += 1
            phoneTextField.backgroundColor = whiteColor
            
        } else {
            phoneTextField.backgroundColor = redColor
        }
        if counter == 5 {
            submitButton.isEnabled = true
        }
    }
    
    @IBAction func passwordTapped(_ sender: UITextField) {
        let passwordCharacterArray = Array(passwordTextField.text!.characters)
        let countPassword = passwordCharacterArray.count
        guard let password = passwordTextField.text, password != "" else {
            print("password is empty")
            return
        }
        if countPassword > 6 {
        counter += 1
        passwordTextField.backgroundColor = whiteColor
        } else {
        passwordTextField.backgroundColor = redColor
        }
        if counter == 5 {
            submitButton.isEnabled = true
        }
    }
    @IBAction func passwordConfirmTapped(_ sender: UITextField) {
        guard let passwordConfirm = passwordConfirmTextField.text, passwordConfirm != "" else {
            print("password confirm is empty")
            return
        }
        if passwordTextField.text == passwordConfirmTextField.text {
        counter += 1
        passwordConfirmTextField.backgroundColor = whiteColor
        } else {
        passwordConfirmTextField.backgroundColor = redColor
        }
        if counter == 5 {
            submitButton.isEnabled = true
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.yellow
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
        
        fields = [ emailTextField, emailConfirmationTextField, phoneTextField, passwordConfirmTextField, passwordTextField]
        
        for field in fields {
            field.backgroundColor = UIColor.white
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
