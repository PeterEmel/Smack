//
//  MessageService.swift
//  Smack
//
//  Created by Peter Emel on 3/1/20.
//  Copyright © 2020 Peter Emel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                if let json = JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        
                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                        
                        self.channels.append(channel)
                    }
                    print(self.channels[0].channelTitle)
                    completion(true)
                    
                    //Shorter but first way is better
                    //                do{
                    //                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                    //                }catch let error{
                    //                    debugPrint(error as Any)
                    //                }
                    //                print(self.channels)
                    
                    
                }else{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
        }
    }
}
