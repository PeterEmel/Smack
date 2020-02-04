//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Peter Emel on 1/29/20.
//  Copyright © 2020 Peter Emel. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func createAccntPressed(_ sender: UIButton) {
        guard let email = emailTxt.text, emailTxt.text != "" else{return}
        guard let pass = passTxt.text, passTxt.text != "" else{return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("Logged in user! ", AuthService.instance.authToken)
                        //print("Logged in user!: \(AuthService.instance.authToken)")
                    }else{
                        debugPrint("Error from login")
                    }
                })
            }else{
                debugPrint("Error from register")
            }
        }
    }
   
    
    @IBAction func pickAvatarPressed(_ sender: UIButton) {
    }
    @IBAction func pickBGColorPressed(_ sender: UIButton) {
    }
    @IBAction func closePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToChannel", sender: nil)
    }
}
