//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 12/02/2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    
    // MARK: - Propertis
    private let factory = SceneFactory.self
    private let userStorage = UserStorage.shared
    
    // MARK: - Methods
    override func start() {
        userStorage.passedOnboarding = false
        if userStorage.passedOnboarding {
            showMainFlow()
        } else {
            showOnboardingFlow()
        }
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

//MARK: - Navigation methds
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationContoller = navigationContoller else { return }
        factory.makeOnboardingFlow(coordinator: self, finishDeligate: self, navigationContoller: navigationContoller)
    }
    
    func showMainFlow() {
        guard let navigationContoller = navigationContoller else { return }
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDeligate: self)
        navigationContoller.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDeligate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            navigationContoller?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationContoller?.popViewController(animated: false)
        }
    }
}
