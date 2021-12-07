//
//  UserHome.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit

class UserHome: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //var
    var email : String?
    var username : String?
    
    
    //widget
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var Searchbar: UISearchBar!
    
    
    @IBOutlet weak var welcome: UITextView!
    
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //welcome.text = "Welcome "+email!
        //welcome.text = "Welcome "+username!
        // Do any additional setup after loading the view.
    }
    

    //Action
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
        }
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
     
    
        
    
    
    
    @IBAction func OnClickSelectImage(_ sender: Any) {
    }
    
    
    @IBOutlet weak var tabBar: UITabBar!
    
}
