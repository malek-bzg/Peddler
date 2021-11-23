//
//  CreateNewAccount.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit
import Alamofire

class CreateNewAccount: UIViewController {
    

    //var
    let userViewModel = UserViewModel()
    
    
    //widget
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Number: UITextField!
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var Adress: UITextField!
    @IBOutlet weak var Code: UITextField!
    @IBOutlet weak var CIN: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfirmPass: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "accueilSegue"{
            let destination = segue.destination as! UserHome
            destination.username = Name.text
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
        
        if (Password.text != ConfirmPass.text) {
            return
        }
        
        var user = users(
            email: mail.text,
            password: Password.text,
            phoneNumber: Number.text,
            profilePicture: nil,
            FirstName: Name.text,
            lastName: nil
        )
        
        //userViewModel.inscription(user: user)
        performSegue(withIdentifier: "accueilSegue", sender: nil)
        
    }
}
