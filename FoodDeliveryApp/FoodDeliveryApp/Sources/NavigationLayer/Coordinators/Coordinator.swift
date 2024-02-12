//
//  Coordinator.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 12/02/2024.
//

import UIKit

enum CoordinatorType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
}

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationContoller: UINavigationController? { get set }
    var finishDeligate: CoordinatorFinishDeligate? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    
    func removeChildCordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator } 
    }
}

protocol CoordinatorFinishDeligate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}
