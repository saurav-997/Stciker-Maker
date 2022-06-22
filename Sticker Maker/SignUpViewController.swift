//
//  SignUpViewController.swift
//  Sticker Maker
//
//  Created by Saurav Sharma on 22/06/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var mailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.isHidden = true
        
        mailView.layer.cornerRadius = 7.5
        passwordView.layer.cornerRadius = 7.5
        
        mailView.layer.borderWidth = 1.25
        passwordView.layer.borderWidth = 1.25
        
        mailView.layer.borderColor = UIColor.white.cgColor
        passwordView.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
    }
    

}
