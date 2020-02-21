//
//  Register.swift
//  mentorship-ios
//
//  Created by Vatsal Kulshreshtha on 21/02/20.
//  Copyright © 2020 Vatsal Kulshreshtha. All rights reserved.
//

import Foundation

class RegisterUser {
    
    static func register(details: Register) {
                
                do {
                    let jsonData = try JSONEncoder().encode(details)
                    let jsonString = String(data: jsonData, encoding: .utf8)!
                    print(jsonString)

                    let decodedSentences = try JSONDecoder().decode(Register.self, from: jsonData)
                    print(decodedSentences)
                } catch { print(error) }
                    
        //            AF.request(MSUrl.baseUrl,
        //                       method: .post,
        //                       parameters: register,
        //                       encoder: JSONParameterEncoder.default).response { response in
        //                debugPrint(response)
        //            }
    }
}
