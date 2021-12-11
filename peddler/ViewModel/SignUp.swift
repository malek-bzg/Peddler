import Foundation
import UIKit
import Alamofire
import SwiftyJSON


/*enum MyResult<T, E: Error> {
 
 case success(T)
 case failure(E)
 
 }*/
public class SignUp {
    
    //let baseUrl = "DATABASE_URL=mongodb+srv://admin:melek123@peddler.orfuh.mongodb.net/myFirstDatabase?retryWrites=true&w=majority"
    
    func inscription(user: users, completed: @escaping (Bool) -> Void) {
        AF.request("http://localhost:3000/users",
                   method: .post,
                   parameters: [
                    "email": user.email!,
                    "password": user.password!,
                    "phoneNumber": user.phoneNumber!,
                    "profilePicture": user.profilePicture!,
                    "FirstName": user.FirstName!,
                    "LastName": user.lastName!,
                    "ConfirmPass":user.ConfirmPass!,
                    "CIN":user.CIN!,
                    "isadmin":user.isadmin!
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
    
    
    func makeItem(jsonItem: JSON) -> users {
        //let isoDate = jsonItem["dateNaissance"]
        
        return users(
            email: jsonItem["email"].stringValue,
            password: jsonItem["password"].stringValue,
            phoneNumber: jsonItem["phoneNumber"].intValue,
            profilePicture: jsonItem["profilePicture"].stringValue,
            FirstName: jsonItem["FirstName"].stringValue,
            lastName: jsonItem["lastName"].stringValue,
            ConfirmPass: jsonItem["ConfirmPass"].stringValue,
            CIN: jsonItem["CIN"].stringValue,
            isadmin: jsonItem["isadmin"].boolValue
            //token: jsonItem["token"].stringValue
            
            
        )
    }
    
}




