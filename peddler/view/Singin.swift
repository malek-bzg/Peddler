//
//  Singin.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit
import GoogleSignIn
import Foundation
import LocalAuthentication


class Singin: UIViewController {
    
    //var
    let signInConfig = GIDConfiguration.init(clientID: "637487609737-vh73udhpjmfu09qj0v5qcehck1l35hjs.apps.googleusercontent.com")
    let googleLoginButton = GIDSignInButton()
    
    //widget
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var googleSignInStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleSignInStackView.addSubview(googleLoginButton)
        googleLoginButton.addTarget(self, action: #selector(googleSignIn), for: .touchUpInside)
    }
    
    @objc func googleSignIn() {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { [self] user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            
            UserViewModel.sharedInstance.loginWithSocialApp(email: user.profile!.email, firstName: (user.profile?.givenName)!, lastName: (user.profile?.familyName)!) { success, user in
                if success {
                    print("you are connected")
                    if user?.role == "Client" {
                        self.performSegue(withIdentifier: "loginUserSegue", sender: nil)
                    } else {
                        self.performSegue(withIdentifier: "LoginSegue", sender: nil)
                    }
                    
                } else {
                    self.present(Alert.makeAlert(titre: "Error", message: "Invalid credentials"), animated: true)
                }
            }
        }
    }
    
    //Action
    @IBAction func forgetPass(_ sender: Any) {
    }
    
    @IBAction func sing(_ sender: Any) {
        UserViewModel.sharedInstance.login(email: emailTF.text!, password: passwordTF.text!) { success in
            if success {
                print("you are connected")
                if UserDefaults.standard.string(forKey: "role") == "Client" {
                    self.performSegue(withIdentifier: "loginUserSegue", sender: nil)
                } else {
                    self.performSegue(withIdentifier: "LoginSegue", sender: nil)
                }
            } else {
                self.present(Alert.makeAlert(titre: "Error", message: "Invalid credentials"), animated: true)
            }
        }
    }
    
    @IBAction func touchIdLogin(_ sender: Any) {

            

            let localString = "Biometric Authentication"

            let context = LAContext()

               var error: NSError?



               if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {

                   let reason = "Identify yourself!"



                   context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {

                       [weak self] success, authenticationError in



                       DispatchQueue.main.async {

                           if success {

                               self!.performSegue(withIdentifier: "homeSegue", sender: IndexPath.self)

                           } else {

                               // error

                           }

                       }

                   }

               } else {

                   // no biometry

        }
}
}
