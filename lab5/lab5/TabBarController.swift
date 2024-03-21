//
//  TabBarController.swift
//  lab5
//
//  Created by Alibek Tastan on 21.03.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            tabBar.layer.shadowColor = UIColor.gray.cgColor
            tabBar.layer.shadowOpacity = 0.05
            tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
            tabBar.layer.shadowRadius = 1
        
        tabBar.backgroundColor = .white
        
        setupVCs()
    }
    
    private func setupVCs() {
        let dashboard = UINavigationController(
            rootViewController: FirstTabBarViewController()
        )
        let orders = UINavigationController(
            rootViewController: SecondTabBarViewController()
        )
        let notifications = UINavigationController(
            rootViewController: ThirdTabBarViewController()
        )
        
        dashboard.tabBarItem.image = .checkmark
        orders.tabBarItem.image = .add
        notifications.tabBarItem.image = .remove
    
        let viewControllers = [dashboard, orders, notifications]
        
        setViewControllers(viewControllers, animated: true)
    }
    
}
