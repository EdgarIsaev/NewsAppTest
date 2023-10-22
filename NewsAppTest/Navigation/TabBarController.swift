//
//  TabBarController.swift
//  NewsAppTest
//
//  Created by Эдгар Исаев on 21.10.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.isTranslucent = false
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    private func setupItems() {
        let listVC = NewsListVC()
        let favoritesVC = FavoriteNewsScreenVC()
        
        setViewControllers([listVC, favoritesVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(named: "list")
        items[1].image = UIImage(named: "bookmark")
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        }
    }
    
}

