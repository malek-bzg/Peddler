//
//  SetRoleViewController.swift
//  peddler
//
//  Created by Apple Mac on 30/12/2021.
//

import Foundation
import UIKit

class SetRoleViewController: UIViewController {
    
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func register() {
        UserViewModel.sharedInstance.register(user: user!) { [self] (succes) in
            if succes {
                print("add with sucsses")
                self.present(Alert.makeSingleActionAlert(titre: "Success", message: "Account created successfully as a " + user!.role, action: UIAlertAction(title: "Proceed", style: .default, handler: { UIAlertAction in
                    self.performSegue(withIdentifier: "connexionSegue", sender: nil)
                })), animated: true)
            }else{
                print("failed")
            }
        }
    }
    
    @IBAction func setColporteur(_ sender: Any) {
        user?.role = "Colporteur"
        register()
    }
    
    @IBAction func setClient(_ sender: Any) {
        user?.role = "Client"
        register()
    }
    
}
