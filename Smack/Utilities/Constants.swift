//
//  Constants.swift
//  Smack
//
//  Created by Peter Emel on 2/3/20.
//  Copyright © 2020 Peter Emel. All rights reserved.
//

import Foundation

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


typealias CompletionHandler = (_ Success:Bool) -> ()


//URL Constants
let BASE_URL = "https://chattychat1212.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"



//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
