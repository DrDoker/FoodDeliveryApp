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
        finishDeligate?.coordinatorDidFinish(childCoordinator: self)
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
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
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationContoller?.pushViewController(viewController, animated: true)
    }
}
