//
//  stock.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import Foundation

struct stock {
    
    let idStock: String?
    let qteStock: String?
    let qteMin: String?
    let stockPicture: String?
    
    init(idStock: String?, qteStock: String?, qteMin: String?, stockPicture: String?){
        
        self.idStock = "idStock"
        self.qteStock = "qteStock"
        self.qteMin = "qteMin"
        self.stockPicture = "stockPicture"
        
    }
    
}
