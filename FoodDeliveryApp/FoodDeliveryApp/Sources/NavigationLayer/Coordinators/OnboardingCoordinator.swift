//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 12/02/2024.
//

import UIKit

class OnboardingCoordinator: Coordinator  {
     
    override func start() {
        let vc = ViewController()
        navigationContoller?.pushViewController(vc, animated: true)
    }
    
    override func finish() { 
        print("OnboardingCoordinator finish")
    }
}
