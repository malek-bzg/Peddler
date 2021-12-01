//
//  Singin.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit
import GoogleSignIn
import Alamofire

class Singin: UIViewController, GIDSignInUIDelegate {
    
    //var
    
    let userViewModel = UserViewModel()

    //widget
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Singin"{
            let destination = segue.destination as! UserHome
            destination.username = UserName.text
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
        if (Password.text != UserName.text) {
            return
        }
        var UserName = (
        Name: UserName.text,
        password: Password.text
        )
        performSegue(withIdentifier: "Singin", sender: nil)
        
    }
    
    @IBAction func singUp(_ sender: Any) {
    }
    
    
    
}
