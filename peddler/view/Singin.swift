//
//  Singin.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit
import GoogleSignIn

class Singin: UIViewController, GIDSignInUIDelegate {
    
    //var
    
    
    
    
    
    
    //widget
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var Password: UILabel!
    
    
    

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
    }
    
    @IBAction func singUp(_ sender: Any) {
    }
    
    
    
}
