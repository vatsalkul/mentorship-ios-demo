//
//  SignUpViewController.swift
//  mentorship-ios
//
//  Created by Vatsal Kulshreshtha on 21/02/20.
//  Copyright © 2020 Vatsal Kulshreshtha. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Alamofire

class SignUpViewController: UIViewController {

    var needMentoring = false
    var availableToMmentor = false
    var details: Register!
    
    @IBOutlet weak var nameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var usernameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
    }
    
    func configureTextFields() {
        nameTextField.addTarget(self, action: #selector(showError), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(showError), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(showError), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(showError), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(showError), for: .editingChanged)
    }
    
    
    @IBAction func mentorCheckBoxTapped(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            availableToMmentor = false
        } else {
            availableToMmentor = true
            sender.isSelected = true
            
        }
    }
    
    
    @IBAction func menteeCheckBoxTapped(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            needMentoring = false
        } else {
            needMentoring = true
            sender.isSelected = true
            
        }
    }

    
    @IBAction func signUpPressed(_ sender: Any) {
        registerUser()
       }
    

    func registerUser() {
        if validateDetails() {
            details = Register(name: nameTextField.text!, username: usernameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, terms_and_conditions_checked: true, need_mentoring: needMentoring, available_to_mentor: availableToMmentor)
            RegisterUser.register(details: details)
        }
        else {
            print("Unable to validate")
        }
    }
    
    
    @objc func showError(textField: SkyFloatingLabelTextField) {
        if textField.text!.isEmpty {
            textField.errorMessage = MSErrors.emptyField
        } else {
            textField.errorMessage = ""
        }
        if textField == confirmPasswordTextField && confirmPasswordTextField.text! != passwordTextField.text! {
            confirmPasswordTextField.errorMessage = MSErrors.confirmPassword
        } else {
            confirmPasswordTextField.errorMessage = ""
        }
    }
    
    
    func validateDetails() -> Bool {
        var isValid = true
        if nameTextField.text!.isEmpty {
            isValid = false
        }
        if usernameTextField.text!.isEmpty {
            isValid = false
        }
        if emailTextField.text!.isEmpty {
            isValid = false
        }
        if passwordTextField.text!.isEmpty {
            isValid = false
        }
        if confirmPasswordTextField.text!.isEmpty {
            isValid = false
        }
        if passwordTextField.text! != confirmPasswordTextField.text! {
            isValid = false
        }
        if availableToMmentor == false && needMentoring == false {
            isValid = false
        }
        return isValid
    }
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
