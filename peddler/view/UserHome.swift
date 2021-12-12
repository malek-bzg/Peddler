//
//  UserHome.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage


class UserHome: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //var
    var produitName :[String] = []
        
        var prixx = [String]()
        var produitImagee = [String]()
    var email : String?
    var username : String?
    var currentImage = UIImage()
    var data: [String] = []
    
    //widget
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var Searchbar: UISearchBar!
    @IBOutlet weak var welcome: UITextView!
    @IBOutlet weak var produitCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return produitName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                let cv = cell.contentView
                let produitNamelabel = cv.viewWithTag(1) as! UILabel
                
                let produitImagelabel = cv.viewWithTag(2) as! UIImageView
                
                produitNamelabel.text = produitName[indexPath.row]
            
                    
               
                
                var path = String(produitImagee[indexPath.row]).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
               path = path.replacingOccurrences(of: "%5C", with: "/", options: NSString.CompareOptions.literal, range: nil)

                let url = URL(string: path)!
               

                print(url)

              produitImagelabel.af.setImage(withURL: url)
           
                

                
                return cell
                
                
    }
    
    
    
   
    
    
   
    
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadExercises()
        loadProfileImage()

        
      
        //welcome.text = "Welcome "+email!
        //welcome.text = "Welcome "+username!
        // Do any additional setup after loading the view.
    }
    
    func loadExercises()  {
        AF.request("http://localhost:3000/produit", method: .get).responseJSON{ [self]
            response in
            switch response.result{
                
            case .success:
                print(response)
                let myresult = try? JSON(data: response.data!)
               print(myresult)
                produitName.removeAll()
                prixx.removeAll()
                produitImagee.removeAll()
                
                
                for i in myresult!.arrayValue {
                    //print(i)
                    let nom = i["produitName"].stringValue
                    let prix = i["prix"].stringValue
                    let produitImage = "http://localhost:3000/produit"+i["produitImage"].stringValue
                    produitName.append(nom)
                    prixx.append(prix)
                    produitImagee.append(produitImage)
               print(i["produitName"].stringValue)
                };
                print(produitName)
                produitCollectionView.reloadData()
                break
            case .failure:
                print(response.error!)
                
                break
            }
        }
    }
    
   func loadProfileImage()  {
        AF.request("http://localhost:3000/produit", method: .get).responseJSON{
            response in
            switch response.result{
                
            case .success:
                print(response)
                let myresult = try? JSON(data: response.data!)
                print(myresult)
               
                self.produitImagee.removeAll()
                
                
                for i in myresult!.arrayValue {
                    print(i)
                    
                    let produitImage = "http://localhost:3000/produit"+i["produitImage"].stringValue
                  //  print(image)

                    self.produitImagee.append(produitImage)
                   // print(image)
                }
                break
            case .failure:
                print(response.error!)
                
                break
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
            
            userImage.image = image
            currentImage = image
        }
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
     
    
        
    
    
    
    @IBAction func OnClickSelectImage(_ sender: Any) {
    }
    
    
    @IBOutlet weak var tabBar: UITabBar!
    
}
