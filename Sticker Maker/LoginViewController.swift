//
//  LoginViewController.swift
//  Sticker Maker
//
//  Created by Saurav Sharma on 14/06/22.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.isHidden = true
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email ID",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.75)]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.75)]
        )
        
        emailView.layer.cornerRadius = 7.5
        passwordView.layer.cornerRadius = 7.5
        
        emailView.layer.borderWidth = 1.25
        passwordView.layer.borderWidth = 1.25
        
        emailView.layer.borderColor = UIColor.white.cgColor
        passwordView.layer.borderColor = UIColor.white.cgColor
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Auth.auth().addStateDidChangeListener { auth, user in
          // ...
        }
    }
    @IBAction func loginButtonAction(_ sender: Any) {
        loginButton.isHidden = true
        loadingView.isHidden = false
        if let mailText = emailTextField.text {
            if let passwordText = passwordTextField.text {
                Auth.auth().signIn(withEmail: mailText, password: passwordText) { [weak self] authResult, error in
                 guard let self = self else { return }
                    if let error = error {
                        self.loadingView.isHidden = true
                        self.showAlert(titleText: "",messageText: error.localizedDescription)
                        self.loginButton.isHidden = false
                    }
                    else {
                        self.loadingView.stopAnimating()
                        self.loadingView.removeFromSuperview()
                        self.performSegue(withIdentifier: "loginMainVC", sender: nil)
                    }
                }
            }
            else { showAlert(titleText: "Password",messageText: "Please enter your Password.") }
        }
        else { showAlert(titleText: "Email",messageText: "Please enter your Email.") }
    }
    
    @IBAction func signupAction(_ sender: Any)
    {
        self.performSegue(withIdentifier: "showSignup", sender: nil)
    }
    
    
}
extension LoginViewController {
    fileprivate func showAlert(titleText: String, messageText: String){
        let alert = UIAlertController(title: "Invalid \(titleText)", message: "\(messageText)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,handler: { action in
            alert.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
}
