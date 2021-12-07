//
//  AddProduitViewController.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 06/12/2021.
//

import UIKit
import Alamofire
import Foundation

class AddProduitViewController: UIViewController {
    
    
    
    
    //var
    
    
    
    
    
    
    
    //widget
    @IBOutlet weak var produitName: UITextField!
    @IBOutlet weak var prix: UITextField!
    @IBOutlet weak var marge: UITextField!
    @IBOutlet weak var information: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Action
    @IBAction func Add(_ sender: Any) {
        
        
        let prod = produit(prix: prix.text, marge: marge.text, produitName: produitName.text, information: information.text)
        Produitt().addProduit(produit: prod) { (succes) in
            if succes {
                print("add with sucsses")
                
            }else{
                print("failed")
                
            }
        }
    }
    
}



