//
//  produit.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import Foundation

struct produit{
    internal init(prix: String?=nil, marge: String?=nil, produitName: String?=nil, information: String?=nil) {
        self.prix = prix
        self.marge = marge
        self.produitName = produitName
        self.information = information
    }
    
    
    let prix: String?
    let marge: String?
    //let produitPicture: String?
    let produitName: String?
    let information: String?
    
    
} 
