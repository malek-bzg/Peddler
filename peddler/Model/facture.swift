//
//  facture.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import Foundation

struct facture {
    
    let idfacture: String?
    let montantfacture: String?
    let datefacture: Date?
    
    init(idfacture: String?, montantfacture: String?, datefacture: Date?){
        
        self.idfacture = "idfacture"
        self.montantfacture = "montantfacture"
        self.datefacture = Date()
        
        
        
    }
}
