//
//  NetworkinService.swift
//  peddler
//
//  Created by Apple Esprit on 1/12/2021.
//

import Foundation
import Alamofire
import SwiftyJSON
class NetworkingService{
    
    //let baseUrl = "http://localhost:3000/sifflet/api/auth/signin"
    
    func request(email: String, motdepasse: String, completed: @escaping (Bool, Any?) -> Void) {
        AF.request("DATABASE_URL=mongodb+srv://admin:melek123@peddler.orfuh.mongodb.net/myFirstDatabase?retryWrites=true&w=majority",
                   method: .post,
                   parameters: ["email": email, "motdepasse": motdepasse])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    /*let jsonData = JSON(response.data!)
                    let utilisateur = self.makeItem(jsonItem: jsonData)
                    UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "accessToken")
                    print(utilisateur)
                    print(UserDefaults.standard)
                    //print(jsonData)
                    
                    completed(true, utilisateur)*/
                    if let jsonRes  = try? JSONSerialization.jsonObject(with: response.data!, options:[] ) as? [String: Any]{
                       print("JSON", jsonRes)
                        if jsonRes["accessToken"] != nil {
                           
                            
                            UserDefaults.standard.setValue(jsonRes["accessToken"], forKey: "token")

                            UserDefaults.standard.setValue(jsonRes["id"], forKey: "id")
                        /*}
                        if let reponse = jsonRes["user"] as? [String: Any]{
                            for (key,value) in reponse{
                               // print("++++++++++",key,value)
                                UserDefaults.standard.setValue(value, forKey: key)
                                
                            }
                            UserDefaults.standard.setValue("", forKey: "password")*/
                            print(UserDefaults.standard.string(forKey: "token"))
                            completed(true,"good")
                            
                        }else{
                            completed(false,"pas inscrit")
                        }
                    }else{
                        completed(false,nil)
                    }
                case let .failure(error):
                    debugPrint(error)
                    completed(false, nil)
                }
            }
    }
/*
    func makeItem(jsonItem: JSON) -> adminModel {
        //let isoDate = jsonItem["dateNaissance"]
        
        return adminModel(
            nom: jsonItem["nom"].stringValue,
            prenom: jsonItem["prenom"].stringValue,
            email: jsonItem["email"].stringValue,
            role: jsonItem["role"].stringValue,
            motdepasse: jsonItem["motdepasse"].stringValue
            //token: jsonItem["token"].stringValue

            
        )
    }
    */
}
