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
//        showMainFlow()
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
        guard let navigationContoller = navigationContoller else { return }
        
        let homeNavigationContoller = UINavigationController()
        homeNavigationContoller.tabBarItem = UITabBarItem(title: "Home", image: .init(systemName: "star.fill"), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationContoller: homeNavigationContoller)
        homeCoordinator.finishDeligate = self
        homeCoordinator.start()
        
        let orderNavigationContoller = UINavigationController()
        orderNavigationContoller.tabBarItem = UITabBarItem(title: "Order", image: .init(systemName: "star.fill"), tag: 1)
        let orderCoordinator = OrderCoordinator(type: .order, navigationContoller: orderNavigationContoller)
        orderCoordinator.finishDeligate = self
        orderCoordinator.start()
        
        let listNavigationContoller = UINavigationController()
        listNavigationContoller.tabBarItem = UITabBarItem(title: "List", image: .init(systemName: "star.fill"), tag: 2)
        let listCoordinator = ListCoordinator(type: .list, navigationContoller: listNavigationContoller)
        listCoordinator.finishDeligate = self
        listCoordinator.start()
        
        let profileNavigationContoller = UINavigationController()
        profileNavigationContoller.tabBarItem = UITabBarItem(title: "Profile ", image: .init(systemName: "star.fill"), tag: 3)
        let profileCoordinator = ProfileCoordinator(type: .home, navigationContoller: profileNavigationContoller)
        profileCoordinator.finishDeligate = self
        profileCoordinator.start()
        
        addChildCordinator(homeCoordinator)
        addChildCordinator(orderCoordinator)
        addChildCordinator(listCoordinator)
        addChildCordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationContoller, orderNavigationContoller, listNavigationContoller, profileNavigationContoller]
        let tabBarController = TabBarContoller(tabBarContollers: tabBarControllers)
        
        navigationContoller.pushViewController(tabBarController, animated: true)
        
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
