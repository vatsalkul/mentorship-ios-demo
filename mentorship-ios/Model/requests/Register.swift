//
//  Register.swift
//  mentorship-ios
//
//  Created by Vatsal Kulshreshtha on 21/02/20.
//  Copyright © 2020 Vatsal Kulshreshtha. All rights reserved.
//

import Foundation

struct Register: Codable {
    let name: String
    let username: String
    let email: String
    let password: String
    let terms_and_conditions_checked: Bool
    let need_mentoring: Bool
    let available_to_mentor: Bool
}

