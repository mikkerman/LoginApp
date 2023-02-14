//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Михаил Герман on 14.02.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    let userName = "1"
    let password = "2"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeText = "Welcome, \(userNameTextField.text ?? "")!"
        
    }
    

    @IBAction func logInButtonTapped() {
        if userNameTextField.text != userName || passwordTextField.text != password {
            showPromptAlert(
                withTitle: "Warning",
                andMessage: "Invalid User Name or password!")
        }
        
    }
    
    @IBAction func forgotLogInButtonTapped() {
        showPromptAlert(withTitle: "User Name", andMessage: "Your User Name is \(userName)")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showPromptAlert(withTitle: "Password", andMessage: "Your password is \(password)")
    }
    
    
    @IBAction func LogOutButtonTapped(_ unwingSegue: UIStoryboardSegue) {
        guard unwingSegue.source is WelcomeViewController else { return }
        userNameTextField.text = ""
        passwordTextField.text = ""
        
    }

}



extension LoginViewController {
    private func showPromptAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert )
        let okAction = UIAlertAction(title: "Close", style: .default) {_ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
//    private func showWarningAlert(withTitle: String, andMessage message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert )
//        let okAction = UIAlertAction(title: "OK", style: .default)
//        alert.addAction(okAction)
//        present(alert, animated: true)
//    }
    
}

