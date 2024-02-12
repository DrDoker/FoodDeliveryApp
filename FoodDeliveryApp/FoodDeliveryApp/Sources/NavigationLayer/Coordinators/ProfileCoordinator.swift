//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 13/02/2024.
//

import UIKit

class ProfileCoordinator: Coordinator  {
     
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .blue
        navigationContoller?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("OnboardingCoordinator finish")
    }
}
