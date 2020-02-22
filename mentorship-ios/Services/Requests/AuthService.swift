//
//  Register.swift
//  mentorship-ios
//
//  Created by Vatsal Kulshreshtha on 21/02/20.
//  Copyright © 2020 Vatsal Kulshreshtha. All rights reserved.
//

import Foundation
import Alamofire

class AuthServices {
    
    static func register(details: Register) {
            
            AF.request("\(MSConstants.baseUrl)register", method: .post, parameters: details, encoder: JSONParameterEncoder.default).responseJSON{ (response) in
                
                switch response.result {
                    case .success(let JSON):
                        let msg = JSON as! [String : Any]
                        let serverMsg = msg["message"] as! String
                        print(serverMsg)
                    break
                    case .failure(let error):
                        print(error)
                }
            }
    }
        

        static func login(user: Login) {

               AF.request("\(MSConstants.baseUrl)login", method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseJSON{ (response) in
                print(response.result)
                   switch response.result {
                       case .success(let JSON):
                           let msg = JSON as! [String : Any]
                           print(msg)
                       break
                       case .failure(let error):
                           print(error)
                   }
               }
           }
}
