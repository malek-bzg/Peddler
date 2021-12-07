
import Foundation
import Alamofire
import SwiftyJSON


/*enum MyResult<T, E: Error> {
 
 case success(T)
 case failure(E)
 
 }*/
class NetworkingService{
    
    //let baseUrl = "DATABASE_URL=mongodb+srv://admin:melek123@peddler.orfuh.mongodb.net/myFirstDatabase?retryWrites=true&w=majority"
    
    func connection(email: String, password: String, completed: @escaping (Bool, users?) -> Void) {
        AF.request("http://localhost:3000/users/log",
                   method: .post,
                   parameters: ["email": email, "password": password])
            .validate(statusCode: 200..<300)
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
                     
                     completed(true, utilisateur)
                    if let jsonRes  = try? JSONSerialization.jsonObject(with: response.data!, options:[] ) as? [String: Any]{
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
                            completed(true,utilisateur)
                            
                        }else{
                            completed(false,utilisateur)
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
    
    func makeItem(jsonItem: JSON) -> users {
        //let isoDate = jsonItem["dateNaissance"]
        //let isoDate = "2016-04-14T10:44:00+0000"
     
        
        return users(
        
            email: jsonItem["email"].stringValue,
            password: jsonItem["password"].stringValue,
            phoneNumber: jsonItem["phoneNumber"].intValue,
            profilePicture: jsonItem["profilpicture"].stringValue,
            FirstName: jsonItem["FirstNome"].stringValue,
            lastName: jsonItem["lastName"].stringValue,
            ConfirmPass: jsonItem["ConfirmPass"].stringValue,
            CIN: jsonItem["CIN"].stringValue,
            isadmin: jsonItem["isadmin"].boolValue
            
            
            
        )
    }
     
}
