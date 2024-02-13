//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 12/02/2024.
//

import UIKit

class OnboardingCoordinator: Coordinator  {
     
    override func start() {
        showOnboarding()
    }
    
    override func finish() { 
        print("OnboardingCoordinator finish")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .purple
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .red
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .yellow
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationContoller?.pushViewController(viewController, animated: true)
    }
}
