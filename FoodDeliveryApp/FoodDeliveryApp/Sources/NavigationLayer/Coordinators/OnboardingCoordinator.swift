//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 12/02/2024.
//

import UIKit

// MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator  {
    
    // MARK: - Propertis
    private let factory = SceneFactory.self
    
    // MARK: - Methods
    override func start() {
        showOnboarding()
    }
    
    override func finish() { 
        finishDeligate?.coordinatorDidFinish(childCoordinator: self)
    }
}

// MARK: - Navigation methds
private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnboardingScene(coordinator: self)
        navigationContoller?.pushViewController(viewController, animated: true)
    }
}
