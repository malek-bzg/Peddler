//
//  produit.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import Foundation

struct Produit{
    
    internal init(_id: String? = nil, name: String, imagePath: String, price: Float, marge: String, information: String) {
        self._id = _id
        self.name = name
        self.imagePath = imagePath
        self.price = price
        self.marge = marge
        self.information = information
    }
    
    var _id: String?
    var name: String
    var imagePath: String
    var price: Float
    var marge: String
    var information: String
} 
