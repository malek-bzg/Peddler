//
//  updateprofil.swift
//  peddler
//
//  Created by iMac on 2/1/2022.
//

//
//  CreateNewAccount.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit
import Foundation

class updateprofil: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    //var
    var user: User?
    
    //widget
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var ConfirmPass: UITextField!
    @IBOutlet weak var CIN: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modifsegue"{
            let destination = segue.destination as! SetRoleViewController
            destination.user = user
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Action
    @IBAction func poli(_ sender: Any) {
    }
    
    @IBAction func Modifier(_ sender: Any) {
        
        user = User(firstName: FirstName.text!, lastName: lastName.text!, cin: CIN.text!, email: email.text!, address: "", password: password.text!, phoneNumber: phoneNumber.text!, role: "User")
        
        
        self.performSegue(withIdentifier: "modifsegue", sender: user)
        
        
    }
}



