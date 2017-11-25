//
//  LoginViewController.swift
//  TugasAkhir
//
//  Created by iosdev on 11/25/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginIDTextField: UITextField!
    @IBOutlet weak var loginPassTextField: UITextField!
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var clickhereButton: RoundButton!
    @IBOutlet weak var enterButton: RoundButton!
    
    @IBOutlet weak var signupView: UIView!
    @IBOutlet weak var signupIDTextField: UITextField!
    @IBOutlet weak var signupPassTextField: UITextField!
    @IBOutlet weak var signupRePassTextField: UITextField!
    @IBOutlet weak var saveButton: RoundButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupView.isHidden = true
        signupIDTextField.isHidden = true
        signupPassTextField.isHidden = true
        signupRePassTextField.isHidden = true
        saveButton.isHidden = true
    }
    
    @IBAction func clickhereButtonTap(_ sender: Any) {
        signupView.isHidden = false
        signupIDTextField.isHidden = false
        signupPassTextField.isHidden = false
        signupRePassTextField.isHidden = false
        saveButton.isHidden = false
        
        loginView.isHidden = true
        loginIDTextField.isHidden = true
        loginPassTextField.isHidden = true
        loginLabel.isHidden = true
        signupLabel.isHidden = true
        orLabel.isHidden = true
        clickhereButton.isHidden = true
        enterButton.isHidden = true
    }
    
    @IBAction func saveButtonTap(_ sender: Any) {
        if signupIDTextField.text == "" || signupPassTextField.text == "" || signupRePassTextField.text == ""{
            let alertControler = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertControler.addAction(defaultAction)
            present(alertControler, animated: true, completion: nil)
        }else{
            FIRAuth.auth()?.createUser(withEmail: signupIDTextField.text!, password: signupPassTextField.text!) {(user, error) in
            
                if error == nil{
                    self.signupView.isHidden = true
                    self.signupIDTextField.isHidden = true
                    self.signupPassTextField.isHidden = true
                    self.signupRePassTextField.isHidden = true
                    self.saveButton.isHidden = true
                    
                    self.loginView.isHidden = false
                    self.loginIDTextField.isHidden = false
                    self.loginPassTextField.isHidden = false
                    self.loginLabel.isHidden = false
                    self.signupLabel.isHidden = false
                    self.orLabel.isHidden = false
                    self.clickhereButton.isHidden = false
                    self.enterButton.isHidden = false
                }else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func enterButtonTap(_ sender: Any) {
//        if loginIDTextField.text != "" || loginPassTextField.text != ""{
//            FIRAuth.auth()?.signInAnonymously(completion: {(user, error) in
//                if let err = error{
//                    print(err.localizedDescription)
//                    return
//                }
//                self.performSegue(withIdentifier: "loginsegue", sender: nil)
//            })
//        }
        if loginIDTextField.text == "" || loginPassTextField.text == ""{
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }else{
            FIRAuth.auth()?.signIn(withEmail: self.loginIDTextField.text!, password: self.loginPassTextField.text!){(user, error) in
                
                if error == nil{
                    print("You have successfully logged in")
                    self.performSegue(withIdentifier: "loginsegue", sender: nil)
                }else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
