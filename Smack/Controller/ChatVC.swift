//
//  ChatVC.swift
//  Smack
//
//  Created by Peter Emel on 1/29/20.
//  Copyright © 2020 Peter Emel. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //Oultes
    @IBOutlet weak var menuButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            }
            MessageService.instance.findAllChannels { (success) in
                
            }
        }
        
    }
    
}
