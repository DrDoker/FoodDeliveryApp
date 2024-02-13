//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 13/02/2024.
//

import UIKit

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    // MARK: - Propertis
    weak var coordinator: OnboardingCoordinator?
    
    init(coordinator: OnboardingCoordinator?) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        coordinator?.finish()
    }
    
}
