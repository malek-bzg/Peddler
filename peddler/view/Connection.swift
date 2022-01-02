//
//  Connection.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit

class Connection: UIViewController {
    
    //var
    var role: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setRoleSegue" {
            let destination = segue.destination as! Connection
            destination.role = role
        }
    }
    
    //widget

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //Action
    @IBAction func singIn(_ sender: Any) {
    }
    
    @IBAction func createAccount(_ sender: Any) {
    }
}
