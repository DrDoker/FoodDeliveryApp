//
//  ListCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 13/02/2024.
//

import UIKit

class ListCoordinator: Coordinator  {
     
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationContoller?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("OnboardingCoordinator finish")
    }
}
