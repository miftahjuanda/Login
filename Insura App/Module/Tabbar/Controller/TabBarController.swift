//
//  TabBarController.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 22/02/22.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpTabbar()
    }
    
    private func setUpTabbar() {
        let home = HomeViewController()
        let tabHome = UITabBarItem(title: "Home",
                                   image: UIImage(systemName: "house"),
                                   selectedImage: UIImage(systemName: "house.fill"))
        tabHome.badgeColor = .red
        
        home.tabBarItem = tabHome
        
        let profile = ProfileViewController()
        
        let tabProfile = UITabBarItem(title: "Profile",
                                      image: UIImage(systemName: "person"),
                                      selectedImage: UIImage(systemName: "person.fill"))
        tabProfile.badgeColor = .red
        
        profile.tabBarItem = tabProfile
        
        self.viewControllers = [home, profile]
    }
    
}
