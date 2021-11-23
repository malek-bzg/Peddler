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
    
    
    //widget
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var Searchbar: UISearchBar!
    
    @IBOutlet weak var welcome: UITextView!
    
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        welcome.text = "Welcome "+username!
        // Do any additional setup after loading the view.
    }
    

    //Action
    @IBOutlet weak var tabBar: UITabBar!
    
}
