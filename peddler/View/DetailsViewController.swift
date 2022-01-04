//
//  DetailsViewController.swift
//  peddler
//
//  Created by iMac on 23/12/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //var
    var produit: Produit?

    //widgets
    
    @IBOutlet weak var produitImage: UIImageView!
    @IBOutlet weak var produitLabel: UILabel!
    @IBOutlet weak var informationLabel: UITextView!
    
    @IBOutlet weak var prixLABEL: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modifSeg" {
            let destination = segue.destination as! ModifProduitViewController
            destination.produit = produit
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        produitLabel.text = produit?.name
        prixLABEL.text = "Price : " + String((produit?.price)!)
        informationLabel.text = "Infos : " + produit!.information
        
        ImageLoader.shared.loadImage(identifier: produit!.imagePath, url: HOST_IMAGES + produit!.imagePath) { image in
            self.produitImage.image = image
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToCart(_ sender: Any) {
        PanierViewModel.sharedInstance.addToCart(idProduit: (produit?._id)!) { success in
            if success {
                self.present(Alert.makeAlert(titre: "Success", message: "Added to cart !"), animated: true)
            }
        }
    }
    
    @IBAction func modifier(_ sender: Any) {
        print(produit)
        self.performSegue(withIdentifier: "modifSeg", sender: produit)
    }
    @IBAction func supprimer(_ sender: Any) {
        delete(produit)
    }
}
