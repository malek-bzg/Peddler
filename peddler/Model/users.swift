//
//  users.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import Foundation


struct users: Decodable  {
    let email: String?
    let password: String?
    let phoneNumber: Int?
    let profilePicture: String?
    let FirstName: String?
    let lastName: String?
    let ConfirmPass: String?
    let CIN: String?
    let isadmin: Bool?
    
}
