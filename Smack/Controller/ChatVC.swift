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
        
    }
    
}
