//
//  TabBarContoller.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 13/02/2024.
//

import UIKit

class TabBarContoller: UITabBarController {
    
    init(tabBarContollers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarContollers {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        tabBar.backgroundColor = AppColors.backgrond
        tabBar.tintColor = AppColors.accentOrange
    }
}
