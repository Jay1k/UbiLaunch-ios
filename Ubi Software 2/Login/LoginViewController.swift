//
//  LoginViewController.swift
//  Ubi Software 2
//
//  Created by HGPMAC85 on 7/26/19.
//  Copyright © 2019 HGPMAC85. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBAction func loginUser(_ sender: UIButton)
    {
        
        if (emailText.text != "" && passwordText.text != nil)
        {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!, completion: {(user, error) in
                
                if user != nil
                {
                    self.performSegue(withIdentifier: "logintohome", sender: self)
                }
                else
                {
                    if let myError = error?.localizedDescription
                    {
                        print(myError)
                    }
                    else
                    {
                        print("Error")
                    }
                    
                }
                
            })
            
        }
    }
    
    
    @IBAction func signUpUser(_ sender: UIButton) {
    
        Auth.auth().createUser (withEmail: emailText.text!, password: passwordText.text!, completion: {(user, error) in
            
            if user != nil
            {
                self.performSegue(withIdentifier: "logintohome", sender: self)
            }
            else
            {
                if let myError = error?.localizedDescription
                {
                    print(myError)
                }
                else
                {
                    print("Error")
                }
                
            }
        })

    }
    
}
