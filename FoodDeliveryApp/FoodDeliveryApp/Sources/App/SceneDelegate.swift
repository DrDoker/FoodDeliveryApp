//
//  SceneDelegate.swift
//  FoodDeliveryApp
//
//  Created by Serhii  on 07/02/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        let appCoordinator = AppCoordinator(type: .app, navigationContoller: navigationController )
        appCoordinator.start()
    }

} 

