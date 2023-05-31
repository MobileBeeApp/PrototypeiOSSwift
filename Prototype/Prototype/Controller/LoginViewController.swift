//
//  LoginViewController.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    //TODO popup for user
                    print(e.localizedDescription)
//                    self.navigationController?.popToRootViewController(animated: true)
                } else {
                    //Naviagte to the ChatViewController
//                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
                    self.navigationController?.popToRootViewController(animated: true)
//                    self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
                    
                    
                }
            }
        }
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    //popup for user
                    print(e.localizedDescription)
                } else {
                    //Naviagte to the ChatViewController
                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
                    //ViewControllerToChat
//                    self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
//                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
    }
    
    
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
            //jumps back to the main window (root view)
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    
}
