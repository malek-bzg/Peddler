//
//  CreateNewAccount.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit
import Alamofire
import Foundation

class CreateNewAccount: UIViewController {
    

    //var
    var username : String?
    
    
    
    
    //widget
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var ConfirmPass: UITextField!
    @IBOutlet weak var CIN: UITextField!
    @IBOutlet weak var profilePicture: UITextField!
    @IBOutlet weak var isadminSwitch: UISwitch!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "inscriptionSegue"{
            let destination = segue.destination as! UserHome
            destination.username = self.username
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    

    
    
    //Action
    @IBAction func poli(_ sender: Any) {
    }
    
    @IBAction func Register(_ sender: Any) {
        
        username = FirstName.text
        let user = users(email: email.text, password: password.text, phoneNumber: Int((phoneNumber.text)!), profilePicture: profilePicture.text,  FirstName: FirstName.text, lastName: lastName.text, ConfirmPass: ConfirmPass.text, CIN: CIN.text, isadmin: isadminSwitch.isOn)
         
        SignUp().inscription(user: user) { (succes) in
            if succes {
                print("add with sucsses")
                self.performSegue(withIdentifier: "inscriptionSegue", sender: self.username)
            }else{
                print("failed")
                
            }
        }
        
          

     }
        
    }

