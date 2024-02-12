//
//  OrderCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 13/02/2024.
//

import UIKit

class OrderCoordinator: Coordinator  {
     
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .red
        navigationContoller?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("OnboardingCoordinator finish")
    }
}
