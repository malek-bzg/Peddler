//
//  users.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import Foundation


struct users: Decodable  {
    internal init(email: String?, password: String?, phoneNumber: Int?, profilePicture: String? = nil , FirstName: String?, lastName: String?, ConfirmPass: String?, CIN: String?, isadmin: Bool?) {
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.profilePicture = profilePicture
        self.FirstName = FirstName
        self.lastName = lastName
        self.ConfirmPass = ConfirmPass
        self.CIN = CIN
        self.isadmin = isadmin
    }
    
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
