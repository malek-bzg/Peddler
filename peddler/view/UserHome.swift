//
//  UserHome.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 15/11/2021.
//

import UIKit

class UserHome: UIViewController {
    
    
    //var
    var username : String?
    var UserName : String?
    
    
    //widget
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var Searchbar: UISearchBar!
    
    
    @IBOutlet weak var welcome: UITextView!
    
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        welcome.text = "Welcome "+username!
        // welcome.text = "Welcome"+UserName!//
        // Do any additional setup after loading the view.
    }
    

    //Action
    @IBAction func OnClickSelectImage(_ sender: Any) {
    }
    
    
    @IBOutlet weak var tabBar: UITabBar!
    
}
