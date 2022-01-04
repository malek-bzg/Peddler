//
//  UserHome.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit

class UserHome: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //var
    var produits: [Produit] = []
    var currentProduit : Produit?
    
    var prixx = [String]()
    var produitImagee = [String]()
    var email : String?
    var currentImage = UIImage()
    var currentUser : User?
    var data: [String] = []
    
    //widget
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var Searchbar: UISearchBar!
    @IBOutlet weak var welcome: UITextView!
    @IBOutlet weak var produitCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return produits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let cv = cell.contentView
        let produitNamelabel = cv.viewWithTag(1) as! UILabel
        let produitImage = cv.viewWithTag(2) as! UIImageView
        
        let produit = produits[indexPath.row]
        
        produitNamelabel.text = produit.name
        
        ImageLoader.shared.loadImage(identifier: produit.imagePath, url: HOST_IMAGES + produit.imagePath) { image in
            produitImage.image = image
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let produitName = produits[indexPath.row].name
        currentProduit = produits[indexPath.row]
        performSegue(withIdentifier: "mSegue", sender: produitName)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mSegue" {
            let destination = segue.destination as! DetailsViewController
            destination.produit = currentProduit
        } else if segue.identifier ==  "updateProf" {
            let destination = segue.destination as! updateprofil
            destination.user = currentUser
            
        }
        
    }
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initializeProfile()
        initializeProduitsTV()
    }
    
    func initializeProfile()  {
        UserViewModel.sharedInstance.getCurrentUser { [self] success, user in
            welcome.text = "Welcome " + user!.firstName
            currentUser = user
            ImageLoader.shared.loadImage(identifier: user!.phoneNumber, url: HOST_IMAGES + (user?.profilePicture)!) { image in
                userImage.image = image
            }
        }
    }
    
    func initializeProduitsTV()  {
        ProduitViewModel.sharedInstance.getAll { [self] success, produitsFromRep in
            if success {
                produits = produitsFromRep!
                
                collection.reloadData()
            }
        }
    }
    
    //Action-------------------------------------------------------
    @IBAction func addImage(_ sender: Any) {
        showPhotoAlert()
    }
    
    func showPhotoAlert(){
        let alert = UIAlertController(title: "Take Photo From", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {action
            in
            self.getPhoto(type: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {action
            in
            self.getPhoto(type: .photoLibrary)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert,animated: true)
    }
    
    func getPhoto (type : UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            print("image not found")
            return
        }
        
        UserViewModel.sharedInstance.editProfilePicture(email: currentUser!.email, uiImage: image) { [self] success in
            if success {
                userImage.image = image
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func modifProfile(_ sender: Any) {
        print(currentUser)
        performSegue(withIdentifier: "updateProf", sender: currentUser)
    }
    @IBAction func logout(_ sender: Any) {
        
    }
    @IBOutlet weak var switchthemeBtn: UIButton!

        

        @IBAction func modeSwitcher(_ sender: Any) {

            let window = UIApplication.shared.keyWindow

                if #available(iOS 13.0, *) {

                    if window?.overrideUserInterfaceStyle == .dark {

                        switchthemeBtn.tintColor = .white

                        switchthemeBtn.setTitle("Light mode", for: .normal)

                        window?.overrideUserInterfaceStyle = .light

                    } else {

                        switchthemeBtn.tintColor = .darkGray

                        window?.overrideUserInterfaceStyle = .dark

                        switchthemeBtn.setTitle("Dark mode", for: .normal)

                    }

                }

        }
}
