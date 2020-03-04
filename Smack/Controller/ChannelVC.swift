//
//  ChannelVC.swift
//  Smack
//
//  Created by Peter Emel on 1/29/20.
//  Copyright © 2020 Peter Emel. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImage: CircleImage!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
        loginBtn.intrinsicContentSize.width
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        SocketService.instance.getChannel { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
        print(MessageService.instance.channels)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        setupUserInfo()
    }
    
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true)
        }else{
            performSegue(withIdentifier: "toLogin", sender: nil)
        }
    }
    
    func setupUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        }else{
            loginBtn.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? channelCell {
            
            let channel = MessageService.instance.channels[indexPath.row]
            
            cell.configureCell(channel: channel)
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    @IBAction func addChannelPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn{
            let addChannel = AddChannelVC()
            addChannel.modalPresentationStyle = .custom
            present(addChannel, animated: true, completion: nil)
        }
    }
}
