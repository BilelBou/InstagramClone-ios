//
//  TabBarViewController.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 25/04/2021.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    let homeVC = HomeViewController()
    let searchVC = SearchViewController()
    let cameraVC = CameraViewController()
    let likedVC = UINavigationController(rootViewController: LikedViewController())
    let profileVC = UINavigationController(rootViewController: ProfileViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureControllers()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
    
    private func setupTabBar() {
        self.delegate = self
        self.tabBar.tintColor = .label
        self.tabBar.isTranslucent = false
        
        profileVC.navigationBar.isTranslucent = false
        profileVC.navigationBar.tintColor = .label
        likedVC.navigationItem.title = "Activity"
        likedVC.navigationBar.isTranslucent = false
        likedVC.navigationBar.tintColor = .label
    }
    
    private func configureControllers() {
        let item1 = homeVC
        let icon1 = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
         item1.tabBarItem = icon1
        
        let item2 = searchVC
        let icon2 = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        item2.tabBarItem = icon2
        
        let item3 = cameraVC
        let icon3 = UITabBarItem(title: nil, image: UIImage(systemName: "plus"), selectedImage: UIImage(systemName: "plus"))
        item3.tabBarItem = icon3
        
        let item4 = likedVC
        let icon4 = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        item4.tabBarItem = icon4
        
        let item5 = profileVC
        let icon5 = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        item5.tabBarItem = icon5

        
        
         let controllers = [item1, item2, item3, item4, item5]  //array of the root view controllers displayed by the tab bar interface
         self.viewControllers = controllers
    }
}
