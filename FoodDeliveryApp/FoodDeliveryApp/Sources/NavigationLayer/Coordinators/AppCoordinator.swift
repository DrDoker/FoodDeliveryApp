//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 12/02/2024.
//

import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        showOnboardingFlow()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation methds
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationContoller = navigationContoller else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationContoller: navigationContoller, finishDeligate: self)
        addChildCordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        
    }
}

extension AppCoordinator: CoordinatorFinishDeligate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationContoller?.popViewController(animated: false)
        }
    }
}
