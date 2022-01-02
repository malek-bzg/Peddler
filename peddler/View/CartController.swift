//
//  Accueil.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit

class CartController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //var
    var produits: [Produit] = []
    var currentProduit : Produit?
    
    //widget
    @IBOutlet weak var produitsTV: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return produits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cv = cell.contentView
        
        let produitImage = cv.viewWithTag(1) as! UIImageView
        let nomProduitLabel = cv.viewWithTag(2) as! UILabel
        let prixProduitLabel = cv.viewWithTag(3) as! UILabel
        
        let produit = produits[indexPath.row]
        
        nomProduitLabel.text = produit.name
        prixProduitLabel.text = String(produit.name)
        
        ImageLoader.shared.loadImage(identifier: produit.imagePath, url: HOST_IMAGES + produit.imagePath) { image in
            produitImage.image = image
        }
        
        return cell
    }
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initializePaniersTV()
    }
    
    func initializePaniersTV()  {
        PanierViewModel.sharedInstance.getMy { [self] success, panierFromRep in
            if success {
                produits = panierFromRep!.produits
                
                print(produits)
                
                produitsTV.reloadData()
            }
        }
    }
    /*@IBAction func deleteAll(_ sender: Any) {
        ProduitViewModel.sharedInstance.deleteAll { Bool in
            if self.present(Alert.makeSingleActionAlert(titre: "Success", message: "deleted successfully", action: UIAlertAction(title: "Proceed", style: .default, handler: { UIAlertAction in
                self.navigationController?.popViewController(animated: true)
            })), animated: true)
        };else{
            print("failed")
        }

        }*/
        
}
