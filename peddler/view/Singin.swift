//
//  Singin.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit
import GoogleSignIn
import Alamofire
import Foundation


class Singin: UIViewController, GIDSignInUIDelegate {
    
    //var
    var FirstName: String?
    var username : String?
    let userViewModel = UserViewModel()

    //widget
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginsgue"{
            let destination = segue.destination as! UserHome
            destination.username = self.username
        }
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
                  GIDSignIn.sharedInstance().signInSilently()
                  let gSignIn = GIDSignInButton(frame: CGRect(x: 41, y: 700, width: 333, height: 100))
                  view.addSubview(gSignIn)

        // Do any additional setup after loading the view.
    }
    

    //Action
    @IBAction func forgetPass(_ sender: Any) {
    }
    @IBAction func sing(_ sender: Any) {
         
        
       // var UserName = (
       // email: emailTF.text,
       // password: PasswordTF.text)
        
       NetworkingService().connection(email:emailTF.text!, password:PasswordTF.text! ) { h, user in
        //let us = user!
       // self.username = us.FirstName
            if h {
                print("you are connected")
                self.performSegue(withIdentifier: "loginsgue", sender: self.username)
            }else{
                print("you are  connected")
                
            }
        }

    }
    
    @IBAction func singUp(_ sender: Any) {
    }
    
    
    
}
