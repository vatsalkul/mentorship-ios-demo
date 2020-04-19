//
//  ViewController.swift
//  mentorship-ios
//
//  Created by Vatsal Kulshreshtha on 21/02/20.
//  Copyright © 2020 Vatsal Kulshreshtha. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class LoginViewController: UIViewController {

    var loginDetails: Login!

    @IBOutlet weak var usernameTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        loginDetails = Login(username: "vatsalkul", password: "vatsal123")
    }
    @IBAction func loginPressed(_ sender: Any) {
        AuthServices.login(user: loginDetails)
        
    }
}

