//
//  MainTabBarController.swift
//  ChatStudyApp
//
//  Created by IwasakIYuta on 2022/02/03.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
   
    func configureViewControllers(){
        
        
        let recordVC = templateNavigationController(unselectedImage: UIImage(named: "記録0"),selectedImage:UIImage(named: "記録1") ,rootViewController: RecordViewController())
        let chatsearchVC = templateNavigationController(unselectedImage: UIImage(named: "検索0"),selectedImage:UIImage(named: "検索1") ,rootViewController:   ChatSearchViewController())
       let accountVC =  templateNavigationController(unselectedImage: UIImage(named: "アカウント0"),selectedImage:UIImage(named: "アカウント1") ,rootViewController: AccountViewController())
        

        viewControllers = [recordVC,chatsearchVC,accountVC]
        tabBar.backgroundColor = .systemBackground
       // tabBar.tintColor = .label
    }
    
    func templateNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {

        let nav = UINavigationController(rootViewController: rootViewController)
    
        nav.tabBarItem.image = unselectedImage
   
    
        nav.tabBarItem.selectedImage = selectedImage
        
        //nav.navigationBar.tintColor = .label
        return nav
    }


}
