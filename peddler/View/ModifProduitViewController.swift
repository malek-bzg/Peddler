//
//  AddProduitViewController.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 06/12/2021.
//

import UIKit
import Foundation

class ModifProduitViewController: UIViewController {
    
    //var
    var produit: Produit?
    var currentImage = UIImage()
    
    //widget
    @IBOutlet weak var produitName: UITextField!
    @IBOutlet weak var prix: UITextField!
    @IBOutlet weak var marge: UITextField!
    @IBOutlet weak var information: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       initialize()
    }
    
    func initialize()  {
        produitName.text = produit?.name
        prix.text = String(produit!.price)
        marge.text = produit?.marge
        information.text = produit?.information
        //produitImage.text = produit?.name
    }
    
    @IBAction func Modif(_ sender: Any) {
        
        if Float(prix.text!) == nil {
            return
        }
        
        let produit = Produit(_id: produit?._id, name: produitName.text!, imagePath: "", price: Float(prix.text!)!, marge: marge.text!, information: information.text!)
        
        ProduitViewModel.sharedInstance.edit(produit: produit) { succes in
            if succes {
                self.present(Alert.makeSingleActionAlert(titre: "Success", message: "Edited successfully", action: UIAlertAction(title: "Proceed", style: .default, handler: { UIAlertAction in
                    self.navigationController?.popViewController(animated: true)
                })), animated: true)
            }else{
                print("failed")
            }
        }
        }
            
    }
    



