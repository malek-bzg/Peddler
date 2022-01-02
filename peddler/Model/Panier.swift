//
//  commandes.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import Foundation


struct Panier {
    
    internal init(_id: String? = nil, produits: [Produit], user: User) {
        self._id = _id
        self.produits = produits
        self.user = user
    }
    
    var _id: String?
    var produits: [Produit]
    var user: User
}
