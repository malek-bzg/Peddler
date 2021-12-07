//
//  produit.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 06/12/2021.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


public class Produitt{
    

func addProduit(produit: produit, completed: @escaping (Bool) -> Void) {
    AF.request("http://localhost:3000/produit",
               method: .post,
               parameters: [
                "produitName": produit.produitName!,
                "marge": produit.marge!,
                "prix": produit.prix!,
                "information": produit.information!
                
                
                
               ])
        .validate(statusCode: 200..<600)
        .validate(contentType: ["application/json"])
        .responseData { response in
            switch response.result {
            case .success:
                let jsonData = JSON(response.data!)
                let utilisateur = self.makeItem(jsonItem: jsonData)
                UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "accessToken")
                print(utilisateur)
                print(UserDefaults.standard)
                print(jsonData)
                
                completed(true)
                if let jsonRes  = try? JSONSerialization.jsonObject(with: response.data!, options:[] ) as? [String: Any]{
                    if jsonRes["accessToken"] != nil {
                        UserDefaults.standard.setValue(jsonRes["accessToken"], forKey: "token")
                        UserDefaults.standard.setValue(jsonRes["id"], forKey: "id")
                    }
                }
            case let .failure(error):
                print(error)
                completed(false)
            }
        }
}


func makeItem(jsonItem: JSON) -> produit {
    //let isoDate = jsonItem["dateNaissance"]
    
    return produit(
        
        prix: jsonItem["prix"].stringValue,
        marge: jsonItem["marge"].stringValue,
        produitName: jsonItem["produitName"].stringValue,
        information: jsonItem["information"].stringValue
        
        //token: jsonItem["token"].stringValue
        
        
    )
}

}
