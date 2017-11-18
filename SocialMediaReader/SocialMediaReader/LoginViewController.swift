//
//  LoginViewController.swift
//  SocialMediaReader
//
//  Created by jbaumann on 11/14/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        NetworkingService.shared.login(username: usernameTextField.text!, password: passwordTextField.text!) { token in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let messagesViewController = storyboard.instantiateViewController(withIdentifier: "messagesViewController") as! MessagesViewController
            self.present(messagesViewController, animated: true, completion: nil)
        }
    }
    @IBOutlet var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        usernameTextField.text = "jack.baumann"
        passwordTextField.text = "sngum9983"
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        if textField == passwordTextField && !(usernameTextField.text?.isEmpty ?? false) {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
}
