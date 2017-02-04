//
//  LoginViewController.swift
//  TaskMeNot
//
//  Created by Rohit Nisal on 12/23/16.
//  Copyright © 2016 Rohit Nisal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    let loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.backgroundImageView.addSubview(blurEffectView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSignIn(_ sender: UIButton) {
        guard let email = emailField.text, let password = passwordField.text else {
            print("Email and password should be entered to proceed")
            return
        }
//        activityIndicator.isHidden = false
//        activityIndicator.startAnimating()
        loginViewModel.signInUser(withEmail: email, password: password, completionHandler: { response in
            switch response {
            case let .success(responseData) :
                print(responseData)
//                self.activityIndicator.stopAnimating()
                self.performSegue(withIdentifier: "showApp", sender: nil)
            case let .error(errorMessage) :
                print(errorMessage)
//                self.activityIndicator.stopAnimating()
                
            }
        })
    }
    
}
