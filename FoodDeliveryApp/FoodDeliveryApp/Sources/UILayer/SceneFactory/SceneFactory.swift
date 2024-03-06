//
//  SceneFactory.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 06/03/2024.
//

import UIKit

struct SceneFactory {
    
    // MARK: - Onboarding Flow
    static func makeOnboardingFlow(coordinator: AppCoordinator, finishDeligate: CoordinatorFinishDeligate, navigationContoller: UINavigationController) {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationContoller: navigationContoller, finishDeligate: finishDeligate)
        coordinator.addChildCordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    // MARK: - Onboarding
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [UIViewController]()
        let firstVC = OnboardingPartViewController(image: UIImage(resource: .chickenLeg),
                                                   title: "Delicious Food",
                                                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
        let secondVC = OnboardingPartViewController(image: UIImage(resource: .shipped),
                                                    title: "Fast Shipping",
                                                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum rhoncus nulla.")
        let thirdVC = OnboardingPartViewController(image: UIImage(resource: .medal),
                                                   title: "Certificate Food",
                                                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies mauris a id.")
        let fourthVC = OnboardingPartViewController(image: UIImage(resource: .creditCard),
                                                   title: "Payment Online",
                                                   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui ultricies sit massa.")
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return viewController
    }
    
    // MARK: - Main Flow
    static func makeMainFlow(coordinator: AppCoordinator, finishDeligate: CoordinatorFinishDeligate) -> TabBarContoller {
        
        let homeNavigationContoller = UINavigationController()
        homeNavigationContoller.tabBarItem = UITabBarItem(title: "Home", image: .init(systemName: "star.fill"), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationContoller: homeNavigationContoller)
        homeCoordinator.finishDeligate = finishDeligate
        homeCoordinator.start()
        
        let orderNavigationContoller = UINavigationController()
        orderNavigationContoller.tabBarItem = UITabBarItem(title: "Order", image: .init(systemName: "star.fill"), tag: 1)
        let orderCoordinator = OrderCoordinator(type: .order, navigationContoller: orderNavigationContoller)
        orderCoordinator.finishDeligate = finishDeligate
        orderCoordinator.start()
        
        let listNavigationContoller = UINavigationController()
        listNavigationContoller.tabBarItem = UITabBarItem(title: "List", image: .init(systemName: "star.fill"), tag: 2)
        let listCoordinator = ListCoordinator(type: .list, navigationContoller: listNavigationContoller)
        listCoordinator.finishDeligate = finishDeligate
        listCoordinator.start()
        
        let profileNavigationContoller = UINavigationController()
        profileNavigationContoller.tabBarItem = UITabBarItem(title: "Profile ", image: .init(systemName: "star.fill"), tag: 3)
        let profileCoordinator = ProfileCoordinator(type: .home, navigationContoller: profileNavigationContoller)
        profileCoordinator.finishDeligate = finishDeligate
        profileCoordinator.start()
        
        coordinator.addChildCordinator(homeCoordinator)
        coordinator.addChildCordinator(orderCoordinator)
        coordinator.addChildCordinator(listCoordinator)
        coordinator.addChildCordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationContoller, orderNavigationContoller, listNavigationContoller, profileNavigationContoller]
        let tabBarController = TabBarContoller(tabBarContollers: tabBarControllers)
        
        return tabBarController
    }
    
}
