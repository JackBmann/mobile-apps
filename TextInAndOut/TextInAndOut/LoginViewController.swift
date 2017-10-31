//
//  LoginViewController.swift
//  TextInAndOut
//
//  Created by jbaumann on 10/24/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func goButtonTapped(_ sender: Any) {
        print(nameTextField.text ?? "no name")
        print(passwordTextField.text ?? "no password")
        
        UserDefaults.standard.set(nameTextField.text ?? "", forKey: "username")
        UserDefaults.standard.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        if let username = UserDefaults.standard.string(forKey: "username") {
            nameTextField.text = username
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("begin")
    }
    
    // handling return button should be in "textFieldShouldReturn".
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField == passwordTextField && !(nameTextField.text?.isEmpty ?? false) {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {}
    
}
